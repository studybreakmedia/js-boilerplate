'use strict';

const webpack = require('webpack'),
	path = require('path');

let entryJs = path.resolve('src', 'index.js'),
	outJs;

switch(process.env.NODE_ENV){
	case 'test':
		outJs = path.resolve('test','build','bundle.js')
		break;
	default:
		outJs = path.resolve('dist','bundle.js')
		break;
}

module.exports = {
	entry: entryJs,
	output: {
		filename: outJs,
		libraryTarget: 'commonjs' // if this is going to be included by other libraries
	},
	devtool: 'source-map',
	plugins: [
		// https://github.com/webpack/docs/wiki/list-of-plugins
	],
	module: {
		preLoaders: [
			{
				test: /\.js$/, 
				loader: "eslint-loader", 
				exclude: /node_modules/}
		],
		loaders: [
			{
				test: /\.js$/,
				exclude: /node_modules/,
				loader: 'babel'
			}
			// https://webpack.github.io/docs/list-of-loaders.html
		]
	}
	
};