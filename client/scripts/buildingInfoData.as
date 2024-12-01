package
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    [Embed(source="/_assets/assets.swf", symbol="buildingInfo")]
    public dynamic class buildingInfoData extends MovieClip
    {

        public var tInfoRight:TextField;

        public var tName:TextField;

        public var mcBG:MovieClip;

        public var tInfoLeft:TextField;

        public function buildingInfoData()
        {
            var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            stop();
        }
    }
}