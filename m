Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDB07F
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jun 2023 13:04:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 1C6BB5C011C;
	Mon, 26 Jun 2023 09:04:54 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 26 Jun 2023 09:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1687784694; x=1687871094; bh=MK
	V5gydAVbs9zl9e+y997FQxn9afCNfzc0dwm5uw3mg=; b=eOL8+hZREApeGRuMYe
	X8pcp0VcOi0ty/DRWKmeaZkhVXVsZ6aI/62ABj2+Iwxnts1lYDWmCvC71eO+suAo
	dLQMmsGGZKsd9kMCO8lXRjbauIY7E53hFZ8rLN2t0rIAu0DjPkmWs5apl7V4nxqj
	vrL5ugoavV9uVMsJlGxfFtYcO8DQaLIgX9giZfqucS4A5ELgOCeyz24hQuLniHRd
	CaTwnGz9bBa3sbI2TRqo15n1uwDIEiFllYPMbjpC0y7y7z+hfgTWa6ThEgYhwvTT
	4p0mKvRQORzCVoxD0450+AYK223PHOPtR5AV4vocA2Z7Fn1pAxTwLvgDC0RVBK/q
	zqUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687784694; x=1687871094; bh=MKV5gydAVbs9z
	l9e+y997FQxn9afCNfzc0dwm5uw3mg=; b=cQ+M2c1a+N2mxGghALicVObtT04kW
	HTGeeNsy/snQld1s5tT8evlaDg0DvtOeuJQa2qGJZwJiyBaB5D2OX4FpAH+Z8Xii
	I1c/mBKlGdxiwc1hy5gAocfcViC6GrGr/J3+KeOEdphdPq26r+RU8nVDXQCSl6N2
	ozNKx7x9IL6ILyvwSMypOpZpfYiSz0iBwFbtyZ37qqB/Zj5J0uJzHZVBr30tEMjR
	ztOIs610wtiXrxY71BWjTYntZPDfPBGt5ZEAe+bWgnZSMWSpZoifm25hY/eAETIa
	3VzhzQ0zYennwhBv86OU0PeTKdKMnuYmxe572zRPjVspFSA0glrkt7ttw==
X-ME-Sender: <xms:9YyZZFbvQGvHEkMiJ7efQyfb65dl8874WTbIausteSrCg_keB-W7cg>
    <xme:9YyZZMZH64B3kwrnfgutqI8NFagyaJzhjmSdsGFspN9APM7tQq-8kHqtkMni3sriS
    LnEr7RrKmMLLMtC0po>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeehfedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfffgr
    vhhiugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuh
    eqnecuggftrfgrthhtvghrnhepfeelgeeuheeihfeuleefleehtdektdeihffguddvheef
    iefhveelhedvvdfhueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepuggrvhhiugesrhgvrggurghhvggrugdrvghu
X-ME-Proxy: <xmx:9YyZZH_LkRzS1g8KZYnhCfMtc19SYH-jguUEWu_ByN41aBw5QoSb2g>
    <xmx:9YyZZDor3yZEfCXxXLDB4PEWSNVBirWXSaRm_S08Zyr2_WWy9m0taQ>
    <xmx:9YyZZApIl2-TMq0w77aqk4mp67pFn6KrRDjfzrOrBfqWKkFeyjdaOg>
    <xmx:9oyZZNCjVv8q7RqeN7jfskUOuGKO9UikEOsfTIMS13Ov3_sCTSCQfw>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5E3EB1700089; Mon, 26 Jun 2023 09:04:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <148f56af-fac2-4381-af95-a6260567f4a9@app.fastmail.com>
In-Reply-To: 
 <CA+BfgNKDXBfU_d46geMvOHsidASHvLWoCHkC+9Bu-ay-Tr+Dwg@mail.gmail.com>
References: <33c2d66a-84ad-48dd-b8ba-f88a7a68a0fd@app.fastmail.com>
 <CA+BfgNKDXBfU_d46geMvOHsidASHvLWoCHkC+9Bu-ay-Tr+Dwg@mail.gmail.com>
Date: Mon, 26 Jun 2023 15:04:32 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: chrome-platform@lists.linux.dev, "Benson Leung" <bleung@chromium.org>,
 "Guenter Roeck" <groeck@chromium.org>
Subject: Re: cros_ec_lpcs on framework: packet too long (4 bytes, expected 0)
Content-Type: text/plain

Hi

On Wed, Jun 21, 2023, at 5:25 AM, Dustin Howett wrote:
[...]
> We don't currently have any leads on a permanent solution, but some members of
> the community forum are testing out placing the cros_ec_debugfs driver on the
> list of disallowed modules. Doing so reduces the chatter on the host command
> interface, since it no longer needs to query the console periodically.

So you are saying the ACPI entries may communicate on the same bus as the cros-ec driver, and thus you get interleaved messages? That is quite unfortunate. I wonder whether retrying on checksum-mismatch would help?

I assume the kernel cannot lock around ACPI execution, since it doesn't reliably know when the lock is required? (or is it even triggered asynchronously? My acpi knowledge is abysmal..)

Thanks a lot for the heads-up! I haven't been able to trigger it again. If it starts getting annoying, I might try the checksum-retry idea. It might need some random delay, though, to avoid racing the acpi code which I guess does something similar?

Thanks
David
