# **Prompting Guide for GopherGL Development**

**Guiding Principle:** We will build the engine from the outside in. First, we'll establish the application's "shell" (the window and main loop), then populate it with rendering, then add the logic layer (ECS), and finally integrate all systems and add secondary features like physics and audio.

Provide the following prompts to me one by one. Do not combine them.

---

## **Phase 1: Application Core & Rendering Foundation**

This phase establishes a visible window and the fundamental tools to draw within it.

* **Prompt #1: Develop the `app` Package**
    > "As Lead Engine Architect, develop the foundational `pkg/app` package. This module is responsible for the entire application lifecycle.
    >
    > **Key Requirements:**
    > 1. It must use `go-gl/glfw` to initialize, create, and manage the main application window.
    > 2. Create an `AppConfig` struct to specify window `Title`, `Width`, and `Height`.
    > 3. Implement a main `App` struct.
    > 4. Implement a `NewApp(config AppConfig) (*App, error)` function that initializes GLFW, creates the window, and initializes the OpenGL context using `go-gl/gl`.
    > 5. Implement the core game loop methods:
    >     * `Run()`: The entry point that will contain the main loop. For now, it can be a simple loop that calls the methods below.
    >     * `IsRunning() bool`: Returns `false` if the user has requested to close the window.
    >     * `BeginFrame()`: Polls GLFW events and calculates delta time.
    >     * `EndFrame()`: Swaps the graphics buffers.
    >     * `Terminate()`: Cleans up GLFW resources.
    > 6. Provide a comprehensive unit test in `app_test.go`. Since this package manages a window, the test may need to focus on the creation and configuration logic without entering the main loop. You can use build tags like `//go:build !ci` to denote tests that require a graphical environment.
    > 7. The OpenGL context initialization MUST be locked to the main OS thread using `runtime.LockOSThread()`, as required by GLFW and OpenGL."

* **Prompt #2: Develop the `input` Package**
    > "Develop the `pkg/input` package to provide a clean, query-based API for user input. This package must abstract away GLFW's callback-driven system.
    >
    > **Key Requirements:**
    > 1. The package should be initialized by the `app` package, passing the GLFW window instance.
    > 2. Implement a stateful system that tracks the current and previous state of keys and mouse buttons to allow for checking `IsKeyPressed` (fires once on press), `IsKeyDown` (true while held), and `IsKeyReleased` (fires once on release).
    > 3. Provide the following public functions:
    >     * `IsKeyPressed(key glfw.Key) bool`
    >     * `IsKeyDown(key glfw.Key) bool`
    >     * `IsMouseButtonPressed(button glfw.MouseButton) bool`
    >     * `IsMouseButtonDown(button glfw.MouseButton) bool`
    >     * `MousePosition() (x, y float64)`
    > 4. Update the `app` package's `BeginFrame()` method to update the input state for the new frame.
    > 5. Write unit tests for the input logic. This may require mocking the previous and current state arrays to test the functions without a live window."

* **Prompt #3: Develop the `graphics.Shader` Module**
    > "Architect the initial `graphics.Shader` component in the `pkg/graphics` package. This is a critical first step for any rendering.
    >
    > **Key Requirements:**
    > 1. Create a `Shader` struct containing the OpenGL program `ID`.
    > 2. Implement `NewShader(vertexPath, fragmentPath string) (*Shader, error)`. This function must read GLSL source from the two files.
    > 3. The function must compile the vertex and fragment shaders, check for compilation errors, link them into a shader program, and check for linking errors. Return detailed Go errors if any step fails.
    > 4. Implement the methods:
    >     * `Use()` to activate the shader program.
    >     * `Delete()` to clean up the OpenGL program.
    >     * Methods for setting uniform variables (e.g., `SetUniformMat4fv`, `SetUniform1i`).
    > 5. Write a unit test `shader_test.go`. The test should attempt to compile valid and invalid shader source code (provided as temporary files) and assert that errors are handled correctly. This test will require an active OpenGL context, which should be set up in a `TestMain` function for the package."

---

## **Phase 2: Entity-Component-System (ECS) Architecture**

This phase builds the data-oriented core of the engine.

* **Prompt #4: Develop the Core `ecs` Package**
    > "Develop the core `pkg/ecs` package. This is the heart of the engine and must follow an **archetype-based** ECS design for performance.
    >
    > **Key Requirements:**
    > 1. Define the `Entity` type as a simple identifier (e.g., `uint32`).
    > 2. Define `Component` as an empty interface (`interface{}`). Components will be plain data structs.
    > 3. Create the main `World` struct. This struct will manage all entities, components, and archetypes.
    > 4. Implement the following methods on `World`:
    >     * `NewEntity() Entity`: Creates a new entity and returns its ID.
    >     * `AddComponent(entity Entity, component interface{})`: Adds a component to an entity. This will likely trigger moving the entity's data to a new archetype.
    >     * `GetComponent(entity Entity, componentType reflect.Type) interface{}`: Retrieves a component for an entity.
    >     * `RemoveComponent(entity Entity, componentType reflect.Type)`: Removes a component from an entity.
    >     * `DestroyEntity(entity Entity)`
    > 5. The internal implementation must group components by archetype (the unique set of component types an entity possesses) in contiguous slices for cache-friendly iteration. This is non-negotiable.
    > 6. Provide comprehensive unit tests for all public methods, ensuring entities can be created, destroyed, and have components added, retrieved, and removed correctly."

* **Prompt #5: Implement ECS Systems**
    > "Extend the `pkg/ecs` package to support Systems. Systems contain the logic that operates on components.
    >
    > **Key Requirements:**
    > 1. Define a `System` interface. It should have an `Update(dt float32, world *World)` method.
    > 2. Define a `Query(world *World, componentTypes ...reflect.Type)` function. This is a critical function that will return a slice of all entities that possess the specified set of components. The query iterator it returns must be highly efficient, directly accessing the component data within the archetypes.
    > 3. Add methods to the `World` to manage systems:
    >     * `AddSystem(system System)`
    >     * `Update(dt float32)`: This method will iterate through all registered systems and call their `Update` method.
    > 4. Update the main `pkg/app` loop in `Run()` to call `world.Update(dt)` on each frame. You will need to add a `World` instance to your `App` struct.
    > 5. Write unit tests for adding systems and for the query mechanism. Create mock components and a mock system to verify that the query correctly identifies entities and that the system's `Update` method is called."

---

## **Phase 3: Integration and Advanced Rendering**

This phase connects the rendering and ECS layers and implements high-performance 2D rendering.

* **Prompt #6: Integrate Graphics & ECS with a `RenderSystem`**
    > "Integrate the `graphics` and `ecs` packages by creating the foundational components and systems for rendering.
    >
    > **Key Requirements:**
    > 1. In `pkg/graphics`, define two new components:
    >     * `TransformComponent { Position mgl32.Vec2; Scale mgl32.Vec2; Rotation float32 }`
    >     * `SpriteComponent { Color mgl32.Vec4; Texture *Texture }` (The `Texture` will be defined in the next step, for now it can be a placeholder).
    > 2. In `pkg/graphics`, create a `RenderSystem` that implements the `ecs.System` interface.
    > 3. The `RenderSystem.Update` method should use an `ecs.Query` to find all entities with both a `TransformComponent` and a `SpriteComponent`.
    > 4. For now, the `RenderSystem` can simply log the position of the entities it finds. The actual drawing will be implemented next.
    > 5. Update the example runner in `cmd/gophergl-examples` to create a world, add a `RenderSystem`, and create a test entity with transform and sprite components."

* **Prompt #7: Develop `graphics.Texture` and `graphics.SpriteBatch`**
    > "Develop the `Texture` resource and the `SpriteBatch` renderer in the `pkg/graphics` package. The `SpriteBatch` is a critical performance feature.
    >
    > **Key Requirements:**
    > 1. Create a `Texture` struct with a `NewTexture(filePath string) (*Texture, error)` function that loads a PNG image, generates an OpenGL texture, and sets appropriate parameters (e.g., `gl.CLAMP_TO_EDGE`, `gl.LINEAR`).
    > 2. Design and implement the `SpriteBatch` struct. It should manage a single large Vertex Buffer Object (VBO) and a Vertex Array Object (VAO).
    > 3. Implement these methods on `SpriteBatch`:
    >     * `NewSpriteBatch(maxSprites int) (*SpriteBatch, error)`: Initializes buffers.
    >     * `Begin()`: Prepares for a new batch.
    >     * `Draw(texture *Texture, transform mgl32.Mat4, color mgl32.Vec4)`: Adds a sprite's vertex data to an internal buffer. It should *not* issue a draw call immediately.
    >     * `End()`: Flushes the buffered sprite data to the GPU in as few draw calls as possible. It should automatically break batches when the texture changes.
    > 4. Create a `Camera2D` struct in the `pkg/graphics` package that manages view and projection matrices.
    > 5. Update the `RenderSystem` to use the `SpriteBatch` and `Camera2D`. It will iterate through renderable entities, calculate their model matrix from the `TransformComponent`, and submit them to the `SpriteBatch`."

* **Prompt #8: Create a "Drawing a Sprite" Example**
    > "Create the first fully functional example in a new file under `examples/`. This example must validate the integration of the `app`, `ecs`, and `graphics` packages.
    >
    > **Requirements:**
    > 1. The example should use `pkg/app` to create a window.
    > 2. It should set up an ECS `World` and register the `RenderSystem`.
    > 3. It must load a shader and a texture asset.
    > 4. It will create a single entity with a `TransformComponent` and a `SpriteComponent`.
    > 5. The main loop will call `app.Run()`, which in turn updates the `RenderSystem`, which uses the `SpriteBatch` to draw the entity's sprite to the screen. The sprite should be visible in the window."

---

## **Phase 4: Physics, Audio, and Final Features**

This phase adds the remaining core engine features.

* **Prompt #9: Develop the `physics` Package**
    > "Develop the `pkg/physics` package with support for 2D AABB collision detection.
    >
    > **Key Requirements:**
    > 1. Define a `RigidbodyComponent` with `Velocity mgl32.Vec2`.
    > 2. Define an `AABBColliderComponent` with `Size mgl32.Vec2` and an `IsColliding bool` flag.
    > 3. Create a `PhysicsSystem` that implements `ecs.System`.
    > 4. The `PhysicsSystem.Update` method should first update the `TransformComponent.Position` of all entities with a `RigidbodyComponent`.
    > 5. It should then perform a collision check (AABB intersection test) for all entities that have an `AABBColliderComponent`. When a collision is detected, it should set the `IsColliding` flag on the component to `true`.
    > 6. Write unit tests for the AABB intersection logic."

* **Prompt #10: Develop the `audio` Package**
    > "Develop the `pkg/audio` package as a wrapper around `github.com/hajimehoshi/oto/v2`.
    >
    > **Key Requirements:**
    > 1. Create an `AudioManager` that manages the `oto.Context`.
    > 2. Implement a `Sound` struct that holds audio data (e.g., `[]byte`).
    > 3. Create a `NewSound(filePath string) (*Sound, error)` function that loads a `.wav` or `.mp3` file.
    > 4. Implement a `PlaySound(*Sound)` function on the `AudioManager` that plays a sound once.
    > 5. Write a simple `AudioSystem` that could, for example, query for entities that have just collided (`AABBColliderComponent.IsColliding == true`) and play a sound effect."

* **Prompt #11: Develop the `graphics.Font` Module**
    > "Develop font rendering capabilities within the `pkg/graphics` package.
    >
    > **Requirements:**
    > 1. Use `github.com/golang/freetype`.
    > 2. Create a `Font` struct that loads a `.ttf` font file.
    > 3. Implement a `DrawText(batch *SpriteBatch, font *Font, text string, position mgl32.Vec2, color mgl32.Vec4)` function.
    > 4. This function will likely work by rendering glyphs to an in-memory image (a texture atlas) and then using the existing `SpriteBatch` to draw the textured quads for each character. This reuses our high-performance batching system."

* **Prompt #12: Create a Final Comprehensive Example**
    > "Create a final, comprehensive example that showcases all major features of the GopherGL engine working together.
    >
    > **Requirements:**
    > 1. The scene should feature multiple sprites.
    > 2. One entity should be controllable by the player using the `input` package.
    > 3. The player entity and other entities should have physics components and be able to collide.
    > 4. A sound effect from the `audio` package should play upon collision.
    > 5. Use the `Font` rendering module to display an FPS counter or other information on the screen.
    > 6. This example will serve as the primary demonstration of the engine's capabilities."
