const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const TerserPlugin = require('terser-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');


const SR =  path.resolve(__dirname, 'src', 'assets', 'scss');
const SRC = path.resolve(__dirname, './js/app.js');
const DEST =  path.resolve(__dirname, '../priv/static/js');

module.exports = (env, options) => {
  const devMode = options.mode !== 'production';

  return {
    optimization: {
      minimizer: [
        new TerserPlugin({ cache: true, parallel: true, sourceMap: devMode }),
        new OptimizeCSSAssetsPlugin({})
      ]
    },
    //cache: true,
    //entry: {  'app': glob.sync('./vendor/**/*.js').concat(['./js/app.js'])},
    entry: SRC,
    
    output: {
      filename: '[name].js',
      path: DEST,
      publicPath: '/js/'
    },
    devtool: devMode ? 'source-map' : undefined,
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /node_modules/,
          use: {loader: 'babel-loader' },
          resolve: { extensions: ['.js', '.jsx']},
          // include: SRC,
          // enforce: 'pre'
        },
        {
          test: /\.css$/,
          exclude: /node_modules/,
          use: [
              { loader: 'sass-loader', options: { minimize: true  } },
              { loader: 'css-loader', options: { modules: true, sourceMap: true, mportLoaders: 1}},    
          ]
       },
        {
          test: /.scss$/,//test: /\.(sass|scss)$/,
          include: [  path.resolve(__dirname, 'css')],    
          use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader']     
        }
      ]
    },
    plugins: [
      new MiniCssExtractPlugin({ filename: '../css/app.css', }),
      new CopyWebpackPlugin([{ from: 'static/', to: '../' }]   )
      
    ]
  }
};
