//banner图切换
$.fn.Banner = function(){
	var inner = $(this);
	var _w = $(this).find("li").outerWidth(true);
	var _h = $(this).find("li").outerHeight(true);
	var _leng=$(this).find("li").length;
	var _num=0;
	var _qhtime=5000;	
	var _opacitytime=600;	
	inner.css("position","relative");
	inner.children("div").find("span").eq(0).addClass("on")
	function autoplay(){
		if(_num>=_leng-1){
			_num=0;
		}else{
			_num++;
		}
		inner.children("div").find("span").eq(_num).addClass("on").siblings().removeClass("on");
		inner.find("li").eq(_num).fadeTo(_opacitytime,1).siblings("li").fadeTo(_opacitytime,0,function(){
			$(this).hide();
		});
	}
	if(_leng>1){
		inner.find("ul").css({"position":"relative","height":_h});
		$(this).find("li").css({"position":"absolute","height":_h,"display":"none"});
		$(this).find("li").first().show();
		var _time=setInterval(autoplay,_qhtime);
		//上一个按钮
		inner.find(".prev").click(function(){
			if(!inner.find("li").is(":animated")){
				clearInterval(_time);
				_time=setInterval(autoplay,_qhtime);
				if(_num<=0){
					_num=_leng-1
				}else{
					_num--;
				}
				inner.children("div").find("span").eq(_num).addClass("on").siblings().removeClass("on");
				inner.find("li").eq(_num).fadeTo(_opacitytime,1).siblings("li").fadeTo(_opacitytime,0,function(){
					$(this).hide();
				});
			}
		})
		//下一个按钮
		inner.find(".next").click(function(){
			if(!inner.find("li").is(":animated")){
				clearInterval(_time);
				_time=setInterval(autoplay,_qhtime);
				if(_num>=_leng-1){
					_num=0
				}else{
					_num++;
				}
				inner.children("div").find("span").eq(_num).addClass("on").siblings().removeClass("on");
				inner.find("li").eq(_num).fadeTo(_opacitytime,1).siblings("li").fadeTo(_opacitytime,0,function(){
					$(this).hide();
				});
			}
		})
	}
	//鼠标以上切换元素
	inner.children("div").find("span").mouseover(function(){
		if(!inner.find("li").is(":animated")){
			clearInterval(_time);
			_time=setInterval(autoplay,_qhtime);
			var _mun=$(this).index();
			$(this).addClass('on').siblings().removeClass();
			inner.find("li").eq(_mun).fadeTo(_opacitytime,1).siblings("li").fadeTo(_opacitytime,0,function(){
				$(this).hide();
			});
			_num=_mun;
			if(_num==_leng)
			{
				_num=0;
			}
		}
	})
	//鼠标以上暂停切换
	inner.find("ul").hover(function(){
		clearInterval(_time);
	},function(){
		clearInterval(_time);
		_time=setInterval(autoplay,_qhtime);
	})
};
