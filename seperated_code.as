onClipEvent(load){
	jumping=true;
	velY = 0;
	grondY = 335;
	richting = true;
	zijwaarts = 0;
	punten = 0;
	bestPunten = 0;
	_root.score.text = punten;
	_root.bestscore.text = bestPunten;
}

onClipEvent (enterFrame) {
	if(this._x < 15 || this._x > 540) { richting = !richting }
	if (jumping) {
		if(this._yscale < 300) this._yscale +=15;
				this._y -= --velY;
				if(richting){ 
					this._x += zijwaarts; 
					this.bolInner._rotation += zijwaarts;
				}
				else {
					this._x -= zijwaarts;
					this.bolInner._rotation -= zijwaarts;
					}
				
				if (this._y>grondY) {
					this._y = grondY;
						if(punten > bestPunten){
							bestPunten = punten;
							_root.bestscore.text = bestPunten;
						}
					punten = 0;
					_root.score.text = punten;
					jumping = false;
				}
	}
}
on(press){
	this._yscale = 200;
	velY = 18;
	punten++;
	_root.score.text = punten;
	jumping=true;
	if(_xmouse < 0){
		richting = true; 
		zijwaarts = -_xmouse;
		}
	else {
		richting = false; 
		zijwaarts = _xmouse;
		}
}