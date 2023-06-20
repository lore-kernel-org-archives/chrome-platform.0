Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDC78464
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jun 2023 08:13:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id EA3315C011C;
	Tue, 20 Jun 2023 04:13:24 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Tue, 20 Jun 2023 04:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1687248804; x=1687335204; bh=P0aX/Fg8q0CtFAWTpefpIHs6r
	xzWPwpySszMCa8Tru4=; b=K7vUjwZizi/5xo10GRncmJvXhB1Gj9/zt7x0RbcyK
	Dpwrn74WTSQe2K9Eca+3Bh0sVDVXAXnNUvi9ynSRdDkWYaQtgOFs8EtSmpXUTliA
	PqHRaPaPQ3mkh+K1NL6IzxFIB/k426BIA7/d5JdxdYQjMJ6GJhVmzzlBAFVweykI
	BBHCLHAbzamN6NL/5WOsLk70deuWeVHklUCOjeA2fhiSFCtx+3D0+3OH5zYu+vEk
	eAM8QTTZzFmN7LefxQUwL7zgHJUoms5zbFIHE6Y9khXayNDTXn9HdyKRu7wGcFbY
	JyDnImM3S3IpKAxLPQ9OPJqzSv2Ublq3UpqAdhwgB8Yqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1687248804; x=1687335204; bh=P0aX/Fg8q0CtFAWTpefpIHs6rxzWPwpySsz
	MCa8Tru4=; b=ByQPTHHV5XZZAx8msPZSkf2HkFuZpiC+d8va6Mh2CrJ4cnoE9PK
	djOg9Xm7ezfcDtzZwHkh3a636U0xsQHcOldO1IX4bHTIlmGH2hXo3MzX9HtQ6TZx
	mPEvEU4vvuqcxMc5eNoW5WflCRFnEkOqrL3S8f5aB+6K0YRt6ao4z9TCWKxIXouJ
	EUGgkd8gI4gVOCADmljO64owRz6o56sztd/iTOUgKybHqzYkSTEkSRgjKSU4pSoI
	klD+/Exr8wRwcC5WzE122Z8dgp4/AKHdcbFyvVOqEVPAKzH6EYwtMnXapPUofL8L
	VXdhRByIRV/RGBggmBfkt/aY4a/W+ndkQ0w==
X-ME-Sender: <xms:pF-RZOIPxv3-cYOIG-1cjIqUDcWewwfvil0xPKpQ2osxqEvhMm2mvw>
    <xme:pF-RZGLr5-fhMLvR9ssL27mkkAdYdFMNURfneJ11LnwHbqnfn-YPJuskYsMzZrT-8
    DIwyKGab2L04_0HONw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefhedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvfevufgtsehttdertderredtnecuhfhrohhmpedfffgrvhhi
    ugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqne
    cuggftrfgrthhtvghrnhepveeiffetveejgfdtteevleetleejtddvvdeftdffkeejveef
    veeguedtkefgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrvhhiugesrhgvrggurghhvggrugdrvghu
X-ME-Proxy: <xmx:pF-RZOuc8QzvCldRy_BY8PrbtMI3IlYUj5YcQfc2ZaClkUSJGpL9qQ>
    <xmx:pF-RZDZeYk3hp9Pn6JODXaGOUeFYuAvuEYSjxZjOa39g2LxD1_I8Cw>
    <xmx:pF-RZFZlkj1pI1xEObutz0Lkf_PUmY2P2TcDcXp5lesJo_6N9TqSWA>
    <xmx:pF-RZEmHCKmxhoEPDlUvrujviJhCfZ-Sp3NNJ-lON24N-3zexURO8w>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 962FE1700096; Tue, 20 Jun 2023 04:13:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-496-g8c46984af0-fm-20230615.001-g8c46984a
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <33c2d66a-84ad-48dd-b8ba-f88a7a68a0fd@app.fastmail.com>
Date: Tue, 20 Jun 2023 10:12:34 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: chrome-platform@lists.linux.dev
Cc: "Benson Leung" <bleung@chromium.org>,
 "Guenter Roeck" <groeck@chromium.org>
Subject: cros_ec_lpcs on framework: packet too long (4 bytes, expected 0)
Content-Type: text/plain

Hi

(bcc: Dustin Howett and Tzung-Bi Shih, who signed off the original framework patches)

Using the cros-ec over lpc device on the Framework-13, I occasionally get:

    cros_ec_lpcs cros_ec_lpcs.0: packet too long (4 bytes, expected 0)

Afterwards, the entire EC seems to be inactive and none of its controllers work, anymore (temperature sensors are stale, keyboard defunct, etc.). A reboot fixes the issues.

I cannot trigger this issue reliably, yet it seems to happen exclusively under heavy load. Do you have any recommendations how to debug this further?

I failed tracing where the error happens and why any further functionality of the EC is disabled thereafter. Does the driver end communication on an error? Or is this likely a firmware issue and just indicative of the firmware failing?

If you have any recommendations how to enabled the cros-tracing/debug features, I'd gladly run a custom kernel for a while to see where the failure originates.

Thanks
David
