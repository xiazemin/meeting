https://www.runoob.com/react/react-install.html

<script src="https://cdn.staticfile.org/react/16.4.0/umd/react.development.js"></script>
<script src="https://cdn.staticfile.org/react-dom/16.4.0/umd/react-dom.development.js"></script>
<!-- 生产环境中不建议使用 -->
<script src="https://cdn.staticfile.org/babel-standalone/6.26.0/babel.min.js"></script>


实例中我们引入了三个库： react.development.min.js 、react-dom.development.min.js 和 babel.min.js：

react.min.js - React 的核心库
react-dom.min.js - 提供与 DOM 相关的功能
babel.min.js - Babel 可以将 ES6 代码转为 ES5 代码，这样我们就能在目前不支持 ES6 浏览器上执行 React 代码。Babel 内嵌了对 JSX 的支持。通过将 Babel 和 babel-sublime 包（package）一同使用可以让源码的语法渲染上升到一个全新的水平。

https://reactjs.org/
https://zh-hans.reactjs.org/
https://github.com/facebook/react/

我们建议在 React 中使用 CommonJS 模块系统，比如 browserify 或 webpack，本教程使用 webpack。

使用 create-react-app 快速构建 React 开发环境
create-react-app 是来自于 Facebook，通过该命令我们无需配置就能快速构建 React 开发环境。

create-react-app 自动创建的项目是基于 Webpack + ES6 。

$ cnpm install -g create-react-app
$ create-react-app my-app
$ cd my-app/
$ npm start

You are running Node 10.23.0.
Create React App requires Node 14 or higher. 

https://create-react-app.bootcss.com/

create-react-app -V
You are running Node 10.23.0.
Create React App requires Node 14 or higher. 
Please update your version of Node.


https://github.com/facebook/create-react-app

 %  cnpm install -g create-react-app@4.0.3

 % create-react-app -V
4.0.3

% create-react-app my-app

You are running `create-react-app` 4.0.3, which is behind the latest release (5.0.0).

https://create-react-app.dev/docs/getting-started/

% npx create-react-app my-app

% npm init react-app my-app

You are running `create-react-app` 4.0.3, which is behind the latest release (5.0.0).

https://gist.github.com/gaearon/4064d3c23a77c74a3614c498a8bb1c5f


% npm uninstall -g create-react-app
removed 314 packages in 7.625s
% npx create-react-app my-app



https://blog.csdn.net/guiyecheng/article/details/71090225

升级node版本，用n来切换管理node版本

sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo n latest
n
n lts
npm uninstall -g create-react-app@4.0.3
cnpm install -g create-react-app
create-react-app my-app

cd my-app
npm start
