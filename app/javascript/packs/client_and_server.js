ReactDOM = require('react-dom');
React = require('react');
ReactBootstrap = require('react-bootstrap');
// 这里添加必须添加 default 才可以工作, 怀疑这是因为:
// react-player 不是一个标准的组件库, 而是一个独立的组件.
ReactPlayer = require('react-player').default;
