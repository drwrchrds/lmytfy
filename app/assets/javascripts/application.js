// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require_tree .



// function displayImages(){
// 	var animate;
// 	var num = Math.floor(Math.random() * (imagesArray.length+1)); 
// 	animate = setTimeout(displayImages, 20); 
// }


var yelpit = {};

yelpit.linkShortener = function($formEl, $showShortUrl, $goButton, $shortURLSection, createUrl) {
	this.$formEl = $formEl;
	this.$showShortUrl = $showShortUrl;
	this.$goButton = $goButton;
	this.$shortURLSection = $shortURLSection;
	this.createUrl = createUrl;

	this.$formEl.on('submit', this.submitForm.bind(this));
	this.$showShortUrl.on('change', function(e) {
		e.preventDefault();
	});
};

yelpit.linkShortener.prototype.submitForm = function(event) {
	event.preventDefault();
	var data = this.$formEl.serialize();

	$.ajax({
		url: this.createUrl,
		data: data,
		method: 'POST',
		dataType: 'json'
	}).done(
		this.handleAjaxDone.bind(this)
	).fail(
		this.handleAjaxFail.bind(this)
	);
};

yelpit.linkShortener.prototype.handleAjaxFail = function(response) {
	console.log('fail');
	console.log(response);
};

yelpit.linkShortener.prototype.handleAjaxDone = function(response) {
	this.$showShortUrl.val(response.short_url)
	this.$goButton.attr('href', response.short_url);
	this.$shortURLSection.show();
};

yelpit.linkShortener.init = function($formEl, $showShortUrl, $goButton, $shortUrlSection) {
	new yelpit.linkShortener($formEl, $showShortUrl, $goButton, $shortUrlSection, '/create');
};

// TODO add JS modules in this file :)