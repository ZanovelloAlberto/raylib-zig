// raylib-zig (c) Nikolas Wipper 2023

const rl = @import("raylib");

pub fn main() anyerror!void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - mouse input");

    var ballPosition = rl.Vector2.init(-100, -100);
    var ballColor = rl.Color.dark_blue;

    rl.setTargetFPS(60); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------
        ballPosition = rl.getMousePosition();
        ballPosition.x = @intToFloat(f32, rl.getMouseX());
        ballPosition.y = @intToFloat(f32, rl.getMouseY());

        if (rl.isMouseButtonPressed(rl.MouseButton.mouse_button_left)) {
            ballColor = rl.Color.maroon;
        } else if (rl.isMouseButtonPressed(rl.MouseButton.mouse_button_middle)) {
            ballColor = rl.Color.lime;
        } else if (rl.isMouseButtonPressed(rl.MouseButton.mouse_button_right)) {
            ballColor = rl.Color.dark_blue;
        }
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        rl.beginDrawing();

        rl.clearBackground(rl.Color.ray_white);

        rl.drawCircleV(ballPosition, 40, ballColor);

        rl.drawText("move ball with mouse and click mouse button to change color", 10, 10, 20, rl.Color.dark_gray);

        rl.endDrawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    rl.closeWindow(); // Close window and OpenGL context
    //--------------------------------------------------------------------------------------
}
