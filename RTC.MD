https://webrtc.org.cn/
https://github.com/RTC-Developer/WebRTC-Documentation-in-Chinese

网页即时通信（英语：Web Real-Time Communication）的缩写，是一个支持网页浏览器进行实时语音对话或视频对话的API。它于2011年6月1日开源并在Google、Mozilla、Opera支持下被纳入万维网联盟的W3C推荐标准。

https://zhuanlan.zhihu.com/p/86751078
这些API可分成Media API、 RTCPeerConnection、Peer-to-peer Data API三类:

RTCPeerConnection：一个RTCPeerConnection对象允许用户在两个浏览器之间直接通讯。 SDP: 用来描述当前连接者想要传输的内容，支持的协议类型，支持的编解码类型等。 RTCIceCandidate：表示一个ICE协议的候选者，简单的说，就是目标节点的IP以及端口。 RTCIceServer：表示一个ICE Server，其主要用于当前主机的IP发现，通过和ICE Server通讯，我们会得到一组可供连接使用的IP:Port候选值，双方通过交换ICE候选值来建立起连接。

Peer-to-peer Data API
DataChannel：数据通道( DataChannel)接口表示一个在两个节点之间的双向的数据通道，该通道可以设置成可靠传输或非可靠传输 。

Transport / Session
传输部分可基于TCP/UDP，会话层组件采用了libjingle库的部分组件实现

AudioEngine
音频引擎是包含一系列音频多媒体处理的框架，包括从视频采集卡到网络传输端等整个解决方案。

VideoEngine
视频引擎是包含一系列视频处理的整体框架，从摄像头采集视频到视频信息网络传输再到视频显示整个完整过程的解决方案

首先，两个客户端（Alice & Bob）想要创建连接，一般来说需要有一个双方都能访问的服务器来帮助他们交换连接所需要的信息。有了交换数据的中间人之后，他们首先要交换的数据是SessionDescription（SD）

SD 从哪来
一般来说，在建立连接之前连接双方需要先通过API来指定自己要传输什么数据（Audio，Video，DataChannel），以及自己希望接受什么数据，然后Alice调用CreateOffer()方法，获取offer类型的SessionDescription，通过公共服务器传递给Bob，同样地Bob通过调用CreateAnswer()，获取answer类型的SessionDescription，通过公共服务器传递给Alice。 在这个过程中无论是哪一方创建Offer（Answer）都无所谓，但是要保证连接双方创建的SessionDescription类型是相互对应的。Alice=Answer Bob=Offer | Alice=Offer Bob=Answer

ICE
互动式连接建立（Interactive Connectivity Establishment）提供的是一种框架，使各种NAT穿透技术（STUN，TURN...）可以实现统一。该技术可以让客户端成功地穿透远程用户与网络之间可能存在的各类防火墙。

NAT
网路地址转换(Network Address Translation)可为你的装置提供公用IP地址。路由器具备公用IP地址，而连上路由器的所有装置则具备私有IP地址。接着针对请求，从装置的私有IP对应到路由器的公用IP与专属的通讯端口。如此一来，各个装置不需占用专属的公用IP，亦可在网路上被清楚识别。

STUN
NAT 的UDP简单穿越（Simple Traversal of UDP over NATs）是一种网络协议，它允许位于NAT（或多重NAT）后的客户端找出自己的公网地址，查出自己位于哪种类型的NAT之后以及NAT为某一个本地端口所绑定的Internet端端口。这些信息被用来在两个同时处于NAT路由器之后的主机之间建立UDP通信。

即使通过 STUN 服务器取得了公用 IP 地址，也不一定能建立连线。因为不同的NAT类型处理传入的UDP分组的方式是不同的。四种主要类型中有三种是可以使用STUN穿透：完全圆锥型NAT、受限圆锥型NAT和端口受限圆锥型NAT。但大型公司网络中经常采用的对称型 NAT（又称为双向NAT）则不能使用，这类路由器会通过 NAT 布署所谓的「Symmetric NAT」限制。也就是说，路由器只会接受你之前连线过的节点所建立的连线。这类网络就需要TURN技术。

TURN
中继NAT实现的穿透（Traversal Using Relays around NAT）就是通过TURN服务器开启连线并转送所有数据，进而绕过Symmetric NAT的限制。你可通过TURN服务器建立连线，再告知所有端点传送封包至该服务器，最后让服务器转送封包给你。这个方法更耗时且更占频宽，因此在没有其他替代方案时才会使用这个方法。

1.连接双方（Peer）通过第三方服务器来交换（Signalling）各自的SessionDescription数据。 2.连接双方（Peer）通过STUN协议从STUN Server那里获取到自己的NAT结构，子网IP和公网IP，端口，这里的IP和端口对我们称之为ICE Candidate。 3.连接双方（Peer）通过第三方服务器来交换（Signalling）各自ICE Candidates，如果连接双方在同一个NAT下那他们仅通过内网Candidate就能建立起连接，反之如果他们处于非对称型NAT下，就需要STUN Server识别出的公网Candidate进行通讯。 4.如果仅通过STUN Server发现的公网Candidate仍然无法建立连接，换句话说就是连接双方（Peer）中至少有一方处于对称NAT下，这就需要处于对称NAT下的客户端（Peer）去寻求TURN Server提供的转发服务，然后将转发形式的Candidate共享（Signalling）给对方（Peer）。 5.连接双方（Peer）向目标IP端口发送报文，通过SessionDescription中涉及的密钥以及期望传输的内容，建立起加密长连接。

https://zhuanlan.zhihu.com/p/86751078

作者：阿里巴巴淘系技术
链接：https://www.zhihu.com/question/25497090/answer/1314802509
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

传统的直播技术延迟非常大，从观众评论到看到主播给出反馈一般要在十秒以上。通过多媒体技术降低直播延迟、提高主播和粉丝的互动效率是我们研究低延迟直播技术的初衷。我们对当前主流直播技术做了分析，在低延迟直播技术出现前主要有 HLS 和 RTMP/HTTP-FLV 两个协议。HLS：延迟主要来自编码解码时产生延迟、网络延迟、CDN 分发延迟。由于它是切片协议，延迟分两大块，一个是服务端有切片缓冲延迟，另一个是在播放端防抖缓冲会有延迟。切片的大小和数量都会 HLS 影响延迟大小，一般在十秒以上。RTMP/HTTP-FLV: 目前国内大部分厂家在用的 RTMP，它相对于 HLS 在服务端做了优化。RTMP 服务端不再进行切片，而是分别转发每一帧，CDN 分发延迟非常小。RTMP 延迟主要来自播放端防抖缓冲：为提升弱网环境下抖动时直播的流畅度，缓冲延迟一般有五到十秒。这两类协议都是基于 TCP，国内厂商基本上已经将 RTMP over TCP 的延迟做到的极致，如果一个协议仍然基于 TCP 优化延迟，效果上很难优于目前的 RTMP 。TCP 由于其自身的一些特性，并不适用于低延迟直播场景，主要原因如下：重传慢：TCP 的 ACK 确认机制，丢包后发送侧超时重传，超时时间一般200ms，会造成接收侧帧抖动。拥塞判断不准确：基于丢包的拥塞控制算法无法准确判断拥塞，丢包并不等于拥塞；也会造成发送链路 bufferbloat，链路 RTT 增大，延迟增加。灵活性差：这是最主要原因，TCP 拥塞控制算法在操作系统内核层实现，优化成本较高，移动端只有利用系统已有的优化。所以我们选择基于 UDP 的方案实现。

基于 UDP 的两种方案对比，第一种是可靠UDP方向，比如 Quic ，另一种是 RTC 方案，比如 WebRTC 。我们从五个维度对两种方案做了对比：传输方式：Quic 是可靠传输；而 RTC 是半可靠传输，特定情境下可对音视频有损传输，可有效降低延迟。复杂度：Quic 的复杂度非常低，相当于将 TCP 接口换位 Quic 接口即可，RTC方案的复杂很高，涉及一整套的协议设计和QOS保障机制。音视频友好性：Quic 不关心传输内容，对音视频数据透明传输。RTC 对音视频更友好，可针对音视频做定制化优化。方案完备性：从方案完备性方面来讲，Quic 是针对传输层优化，而 WebRTC 可提供端对端优化方案。理论延迟：经我们实验室测试以及线上数据分析，WebRTC 方案的延迟可以达到 1 秒以内。综上，Quic 方案的最大优点是复杂度低，不过这个方案要想达到更低的延迟，也需要引入更多的复杂度。从方案的先进性上看，我们选择 WebRTC 技术作为我们的低延迟方案。同时，我们也相信，RTC 技术和直播技术的融合，是未来音视频传输技术的一个趋势。阿里云 RTS

RTS 是由阿里云和淘宝直播共建的低延迟直播系统，此系统分两大块：上行接入：可接入三种输入方式，第一种是 H5 终端，使用标准 WebRTC 推流到RTS系统中；第二种是 OBS 等传统 RTMP 推流软件，使用 RTMP 协议推流到 RTS 系统中；第三种是低延迟推流端，可以使用我们基于 RTP/RTCP 扩展的私有协议推流到RTS系统中。下行分发：它提供两种低延迟分发，第一种是标准WebRTC 分发，另一种是我们在 WebRTC 基础上的私有协议扩展，淘宝直播目前使用最多的就是基于私有协议的分发。

WebRtc只适合小范围（8人以内）音视频会议，不适合做直播：1. 视频部分：vpx的编码器太弱，专利原因不能用264，做的好的都要自己改264/265代码才行。2. 音频部分：音频只适合人声编码，对音乐和其他非人声的效果很糟糕。3. 网络部分：对国内各种奇葩网络适应性太低，网络糟糕点或者人多点就卡。4. 信号处理：同时用过 GIPS和 WebRTC 进行对比，可以肯定目前开源的代码是GIPS阉割过的。5. 使用规模：10人以内使用，超过10人就挂了，WebEx方案支持的人数都比 RTC 强。

https://www.zhihu.com/question/25497090
https://github.com/webrtc

https://github.com/webrtchacks/adapter
