# Progressive Rendering

This is a port of Dinesh Pandiyan's [progressive rendering demo](https://github.com/flexdinesh/progressive-rendering) to Elixir.
As described in their article here: [https://medium.com/the-thinkmill/progressive-rendering-the-key-to-faster-web-ebfbbece41a4]()

> Progressive rendering is a technique where you can stream portions of a webpage as chunks from the server and the browser will render it as soon as the chunks are received without waiting for the whole HTML string to be received.

## Example

Start the server with `mix run --no-halt`

### Full Rendering

Goto URL - http://localhost:4000/newspaper

The response will come back after taking a while (simulated data latency) and all the whole page will be rendered in one go.

### Progressive Rendering

Goto URL - http://localhost:4000/newspaper/stream

The first chunk (header) of the HTML will come back pretty quickly and will be rendered and other portions of the page will be render as and when the server sends them (after simulated data latency).

## Goal

HTTP is a streaming protocol. The ultimate dream is to use this as an alternative to Single Page Applications — so on slower networks, we will be able to render stuff in the browser quickly.

## License

`views/` and `public/` MIT © Dinesh Pandiyan

Everything else MIT © Rowland Carlson
