package screens
{
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class welcome extends Sprite
	{
		private var bg:Image;
		private var title:Image;
		private var hero:Image;
		
		private var playBtn:Button;
		private var aboutBtn:Button;
		
		public function welcome()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE,onAddedToStage);
		}
		private function onAddedToStage(event:Event):void
		{
			trace("starling framework initialized!");
			
			drawScreen();
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("BgWelcome"))
			this.addChild(bg);
			
			title = new Image(Assets.getTexture("WelcomeTitle"))
			title.x = 440;
			title.y = 20;
			this.addChild(title);
		
			hero = new Image(Assets.getTexture("WelcomeHero"))
			this.addChild(hero);
			hero.x = -hero.width;
			hero.y = 100;
			
			playBtn = new Button(Assets.getTexture("WelcomePlayBtn"));
			playBtn.x = 500;
			playBtn.y = 260;
			this.addChild(playBtn);
			
			aboutBtn = new Button(Assets.getTexture("WelcomeAboutBtn"));
			aboutBtn.x = 410;
			aboutBtn.y = 380;
			this.addChild(aboutBtn);
		}
		
		public function initialize():void
		{
			this.visible = true;
			
			hero.x = -hero.width;
			hero.y = 100;
			
			TweenLite.to(hero, 2, {X:80});
				
			this.addEventListener(Event.ENTER_FRAME, heroAnimation);
			}
			
			private function heroAnimation(event:Event):void
			{
				var currentDate:Date = new Date();
				hero.y = 100 + (Math.cos(currentDate.getTime() * 0.002) * 25);
				playBtn.y = 260 + (Math.cos(currentDate.getTime() * 0.002) * 10);
				aboutBtn.y = 380 + (Math.cos(currentDate.getTime() * 0.002) * 10);
			}
		
		}
	}
}