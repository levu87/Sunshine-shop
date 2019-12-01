$(document).ready(function() {
	//Declare normal variable javascript
	//Hide element when smaller than 1025
	$(".cart .cart-icon").on("click", function() {
		// $(".cart-item-quantity").removeClass("active");
		$(".cart .cart-icon")
			.not($(this))
			.next()
			.removeClass("active");
		$(this)
			.next()
			.toggleClass("active");
		if (
			$(this)
				.next()
				.hasClass("active")
		) {
			$(this).removeClass("active");
		} else {
			$(this).addClass("active");
		}
	});
	
	if ($(window).width() < 1025) {
		$(".bottom-header").fadeIn(function() {
			$(".bottom-header").css({
				display: "flex"
			});
		});
	}

	$(".qty-minus").click(function() {
		var val = $(".product-details-quantity").val();
		if (val > 0) {
			$(".product-details-quantity").val(val - 1);
		} else {
			$(".product-details-quantity").val(0);
		}
	});
	$(".qty-plus").on("click", function() {
		var val = Number($(".product-details-quantity").val());
		$(".product-details-quantity").val(val + 1);
	});

	// $("#range-price").slider({
	// 	range: true
	// });

	$("#range-price").slider({
		range: true,
		min: 0,
		max: 500,
		values: [0, 500],
		slide: function(event, ui) {
			$("#min-price").text(ui.values[0]);
			$("#max-price").text(ui.values[1]);
		}
	});
	// $("#amount").val(
	// 	"Form " +
	// 		$("#range-price").slider("values", 0) +
	// 		" to" +
	// 		$("#range-price").slider("values", 1)
	// );

	//Library init
	$(".lightgallery").lightGallery();
	$(".product-filter-side-wrapper .mobile-filter").on("click", function() {
		$(this)
			.parents(".product-filter-side-wrapper")
			.removeClass("active");
	});
	$(".product-filter-side .title").on("click", function() {
		$(this)
			.parent(".product-filter-side")
			.find(".product-filter-side-wrapper")
			.addClass("active");
	});
	$(document).ready(function() {
		$(".lightgallery").lightGallery();
	});
	function itemQuantity(){
		$(".check-out-button").on("click", function() {
			$(".check-out-button")
				.not($(this))
				.next()
				.removeClass("active");
			$(this)
				.next()
				.toggleClass("active");
			if (
				$(this)
					.next()
					.hasClass("active")
			) {
				$(this).addClass("active");
			} else {
				$(this).addClass("active");
			}
		});
	};
	
		function changeBg(){
			var image=["bg1","bg2","bg3","bg4","bg5","bg6","bg7","bg8","bg9","bg10","bg11"];
		  
		  $(".nav-1 a").hover(function(){
			var value=  $(this).index();
			hoverContent(value);
		  });
		  function hoverContent(value){
			$("#bg").removeClass();
			$("#bg").addClass(image[value]);
		  }
		  };

		  function showMore(){
			$(".items").slice(0,16).show();
			$(".view-more-brand").click(function(e){
			  e.preventDefault();
			  $(".items:hidden").slice(0,4).fadeIn("slow");
			  
			  if($(".items:hidden").length == 0){
				 $(".view-more-brand").fadeOut("slow");
				}
			});
		  }


	//Declare function Javascript
	showMore()
	productCategoryDashboard();
	tabActive();
	mobileToggle();
	mappingNavigation();
	mappingContact();
	mappingSearch();
	mapppingLanguage();
	mappingLink();
	swiperInit();
	flyCart();
	toggleMegaMenuMobile();
	faqDashboard();
	itemQuantity();
	changeBg();
	CustomSelect();
	var temp = location.pathname.split("/").slice(-1)[0];
	let url = "./" + temp;
	jQuery(".navigation-wrapper a").each(function() {
		if ($(this).attr("href") == url)
			$(this)
				.parent()
				.addClass("active");
	});
	// activeAfterLoad();
	if ($(window).width() > 1024) {
		const $menu = $(".searchbox");
		$(document).mouseup(e => {
			if (
				!$menu.is(e.target) && // if the target of the click isn't the container...
				$menu.has(e.target).length === 0
			) {
				// ... nor a descendant of the container
				$menu.removeClass("active");
			}
		});
	}
});

//Check if windows size large then 1024 then these function will be execute

if ($(window).width() > 1024) {
}
// Remove when click outside the circle

function productCategoryDashboard() {
	let li = $(".product-by-category-wrapper ul  li");
	let title = $(".product-by-category-wrapper ul  li .title-caption");
	let content = $(".product-by-category-wrapper ul li .product-wrapper");
	var body = $("html, body");
	title.click(function() {
		// content.slideToggle("slow", function() {
		// 	if (content.is(":visible")) {
		// 		$("html, body").animate({ scrollTop: content.offset().top });
		// 	}
		// });

		if (
			!$(this)
				.parent()
				.hasClass("active")
		) {
			$(".product-by-category-wrapper ul li .product-wrapper")
				.slideUp()
				.delay(500);
			$(this)
				.next()
				.slideDown("1000", function() {
					$("html, body").animate({
						scrollTop: $(this).offset().top - 150
					});
				});

			li.removeClass("active");
			$(this)
				.parent()
				.addClass("active");
		} else {
			$(this)
				.next()
				.slideToggle();
			li.removeClass("active");
		}
	});
}
function CustomSelect() {
	var x, i, j, selElmnt, a, b, c;
	/*look for any elements with the class "custom-select":*/
	x = document.getElementsByClassName("custom-select");
	for (i = 0; i < x.length; i++) {
	  selElmnt = x[i].getElementsByTagName("select")[0];
	  /*for each element, create a new DIV that will act as the selected item:*/
	  a = document.createElement("DIV");
	  a.setAttribute("class", "select-selected");
	  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
	  x[i].appendChild(a);
	  /*for each element, create a new DIV that will contain the option list:*/
	  b = document.createElement("DIV");
	  b.setAttribute("class", "select-items select-hide");
	  for (j = 1; j < selElmnt.length; j++) {
		/*for each option in the original select element,
		create a new DIV that will act as an option item:*/
		c = document.createElement("a");
		c.innerHTML = selElmnt.options[j].innerHTML;
		c.setAttribute('href', selElmnt.options[j].value)
		c.addEventListener("click", function (e) {
		  /*when an item is clicked, update the original select box,
		  and the selected item:*/
		  var y, i, k, s, h;
		  s = this.parentNode.parentNode.getElementsByTagName("select")[0];
		  h = this.parentNode.previousSibling;
		  for (i = 0; i < s.length; i++) {
			if (s.options[i].innerHTML == this.innerHTML) {
			  s.selectedIndex = i;
			  h.innerHTML = this.innerHTML;
			  y = this.parentNode.getElementsByClassName("same-as-selected");
			  for (k = 0; k < y.length; k++) {
				y[k].removeAttribute("class");
			  }
			  this.setAttribute("class", "same-as-selected");
			  break;
			}
		  }
		  h.click();
		});
		b.appendChild(c);
	  }
	  x[i].appendChild(b);
	  a.addEventListener("click", function (e) {
		/*when the select box is clicked, close any other select boxes,
		and open/close the current select box:*/
		e.stopPropagation();
		closeAllSelect(this);
		this.nextSibling.classList.toggle("select-hide");
		this.classList.toggle("select-arrow-active");
	  });
	}
  
	function closeAllSelect(elmnt) {
	  /*a function that will close all select boxes in the document,
	  except the current select box:*/
	  var x, y, i, arrNo = [];
	  x = document.getElementsByClassName("select-items");
	  y = document.getElementsByClassName("select-selected");
	  for (i = 0; i < y.length; i++) {
		if (elmnt == y[i]) {
		  arrNo.push(i)
		} else {
		  y[i].classList.remove("select-arrow-active");
		}
	  }
	  for (i = 0; i < x.length; i++) {
		if (arrNo.indexOf(i)) {
		  x[i].classList.add("select-hide");
		}
	  }
	}
	/*if the user clicks anywhere outside the select box,
	then close all select boxes:*/
	document.addEventListener("click", closeAllSelect);
  }

function faqDashboard() {
	$(".faq-dashboard > li > .title").click(function(e) {
		e.preventDefault();
		if (
			!$(this)
				.parent()
				.hasClass("active")
		) {
			$(".faq-dashboard li .content").slideUp();
			$(this)
				.next()
				.slideToggle();
			$(".faq-dashboard li").removeClass("active");
			$(this)
				.parent()
				.addClass("active");
		} else {
			$(this)
				.next()
				.slideToggle();
			$(".faq-dashboard li").removeClass("active");
		}
	});
}

function tabActive() {
	$(".tab-navigation-wrapper li a").on("click", function() {
		$(this)
			.parents(".tab-navigation-wrapper")
			.find("li")
			.removeClass("active");
		$(this)
			.parents("li")
			.addClass("active");

		var display = $(this).attr("data-type");
		$(".tab-item").removeClass("active");
		$("#" + display).addClass("active");
	});
}

//Mobile Toggle

function mobileToggle() {
	$("header .mobile-toggle em").on("click", function() {
		$(".mobile-wrapper").toggleClass("active");
		let mega = $(".navigation-wrapper ul li.has-mega");
		mega.removeClass("active");
	});
}

function toggleMegaMenuMobile() {
	let parentNav = $(".navigation-wrapper ul li.has-mega em");
	parentNav.on("click", function() {
		$(this)
			.next()
			.parent()
			.toggleClass("active");
	});
	let exitMega = $(".navigation-wrapper ul li.has-mega .mega-wrapper em");
	exitMega.on("click", function() {
		$(this)
			.next()
			.parents(".has-mega")
			.removeClass("active");
	});
}
//Swiper init

function swiperInit() {
	var homeBannerSwiperTop = new Swiper(".home-banner-top .swiper-container", {
		// Optional parameters
		speed: 1250,
		effect: "fade",
		fadeEffect: {
			crossFade: true
		},
		pagination: {
			el: ".swiper-pagination",
			clickable: true
		},
		navigation: {
			nextEl: ".navigation-banner-next",
			prevEl: ".navigation-banner-prev"
		}
	});
	var partnerSwiper = new Swiper(
		".partnet-swiper-wrapper .swiper-container",
		{
			// Optional parameters
			loop: true,
			autoplay: {
				delay: 2500
			},
			breakpointsInverse: true,
			breakpoints: {
				// when window width is >= 320px
				320: {
					slidesPerView: 2,
					spaceBetween: 20
				},
				576: {
					slidesPerView: 3,
					spaceBetween: 20
				},
				768: {
					slidesPerView: 4,
					spaceBetween: 20
				},
				// when window width is >= 480px
				1025: {
					slidesPerView: 5
				},
				// when window width is >= 640px
				1441: {
					slidesPerView: 6,
					spaceBetween: 20
				}
			},
			speed: 1250,
			navigation: {
				nextEl: ".navigation-partner-next",
				prevEl: ".navigation-partner-prev"
			}
		}
	);
	var productBrandSwiper = new Swiper(".product-brands .swiper-container", {
		// Optional parameters
		speed: 1250,
		breakpointsInverse: true,
		breakpoints: {
			// when window width is >= 320px
			320: {
				slidesPerView: 2
			},
			576: {
				slidesPerView: 3
			},
			768: {
				slidesPerView: 4
			},
			// when window width is >= 480px
			1025: {
				slidesPerView: 5
			},
			// when window width is >= 640px
			1441: {
				slidesPerView: 8
			}
		}
	});
	var galleryThumbs = new Swiper(".swiper-product-thumb .swiper-container", {
		spaceBetween: 20,
		freeMode: true,
		watchSlidesVisibility: true,
		slidesPerView: "4",
		watchSlidesVisibility: true,
		watchSlidesProgress: true
	});
	var galleryTop = new Swiper(".swiper-product-top .swiper-container", {
		effect: "fade",
		fadeEffect: {
			crossFade: true
		},
		thumbs: {
			swiper: galleryThumbs
		}
	});
}
// Mapping mobile

function mappingNavigation() {
	return new MappingListener({
		selector: ".navigation-wrapper",
		mobileWrapper: ".mobile-wrapper",
		mobileMethod: "appendTo",
		desktopWrapper: ".header-wrapper-bottom",
		desktopMethod: "prependTo",
		breakpoint: 1025
	}).watch();
}

function mappingSearch() {
	return new MappingListener({
		selector: ".search-wrapper",
		mobileWrapper: ".mobile-wrapper",
		mobileMethod: "appendTo",
		desktopWrapper: ".header-wrapper-top",
		desktopMethod: "prependTo",
		breakpoint: 1025
	}).watch();
}

function mappingContact() {
	return new MappingListener({
		selector: ".contact-wrapper",
		mobileWrapper: ".mobile-wrapper",
		mobileMethod: "appendTo",
		desktopWrapper: ".header-wrapper-top",
		desktopMethod: "prependTo",
		breakpoint: 1025
	}).watch();
}

function mapppingLanguage() {
	return new MappingListener({
		selector: ".language-wrapper",
		mobileWrapper: ".header-wrapper-top",
		mobileMethod: "appendTo",
		desktopWrapper: ".header-wrapper-bottom",
		desktopMethod: "appendTo",
		breakpoint: 1025
	}).watch();
}

function mappingLink() {
	return new MappingListener({
		selector: ".group-link-wrapper",
		mobileWrapper: ".mobile-wrapper",
		mobileMethod: "appendTo",
		desktopWrapper: ".header-wrapper-bottom",
		desktopMethod: "appendTo",
		breakpoint: 1025
	}).watch();
}
function flyCart(){
	$(".figure-product .cart-icon").on("click", function() {
		var cart = $("header .cart-icon");
		var imgtodrag = $(this)
		  .parent(".figure-product")
		  .find("img")
		  .eq(0);
		if (imgtodrag) {
		  var imgclone = imgtodrag
			.clone()
			.offset({
			  top: imgtodrag.offset().top,
			  left: imgtodrag.offset().left
			})
			.css({
			  opacity: "0.5",
			  position: "absolute",
			  height: "150px",
			  width: "150px",
			  "z-index": "100"
			})
			.appendTo($("body"))
			.animate(
			  {
				top: cart.offset().top + 10,
				left: cart.offset().left + 10,
				width: 75,
				height: 75
			  },
			  1000,
			  "easeInOutExpo"
			);
	  
		  setTimeout(function() {
			cart.effect(
			  "shake",
			  {
				times: 2
			  },
			  200
			);
		  }, 1500);
	  
		  imgclone.animate(
			{
			  width: 0,
			  height: 0
			},
			function() {
			  $(this).detach();
			}
		  );
		}
	  });
}
