const Koa = require('koa');
const app = new Koa();
const koaStatic = require('koa-static');
app.use(koaStatic('./public/'))
// response
// app.use(ctx => {
//   ctx.body = '🍺 Hello Koa from zs-node-docker';
// });
 
app.listen(8085);