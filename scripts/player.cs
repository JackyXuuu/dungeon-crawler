//// NOTE: PLAYER MOVEMENT IS DONE IN THE PLAYER.GD SCRIPT INSTEAD
//
//using Godot;
//using System;
//
//public partial class player : CharacterBody2D
//{
	//// Variables to adjust for movement speed
	//const public float Speed = 50.0f;
//
	//public override void _Ready()
	//{
		//// Any initialization code goes here
	//}
//
	//public override void _PhysicsProcess(double delta)
	//{
		//// Initialize velocity with the current value
		//Vector2 _velocity = Velocity;
//
		//// Get directional input as a Vector2
		//Vector2 direction = Input.GetVector("move_left", "move_right", "move_up", "move_down");
//
		//// Adjust horizontal (X) velocity
		//if (direction.X != 0)
		//{
			//_velocity.X = direction.X * Speed;
		//}
		//else
		//{
			//_velocity.X = 0;
		//}
//
		//// Adjust vertical (Y) velocity
		//if (direction.Y != 0)
		//{
			//_velocity.Y = direction.Y * Speed;
		//}
		//else
		//{
			//_velocity.Y = 0;
		//}
//
		//// Apply the new velocity and move the player
		//Velocity = _velocity;
		//MoveAndSlide();
	//}
//}
