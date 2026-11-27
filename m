Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755817;
	b=Q7df4kfUzHsKgcq8veAxJhkC98I60t9JAuBAzpHLJuVNZqCAg14U799LS+J7GVrgKOX+
	 sDbtQ+70vGOJEL76t9PoOEE/oj2qGW7ERHv6X+hXL9o/cNAI71jFToZcU/3vbccR8BYoP
	 TWxBs9vhrHSzuhJh++ghBxBuZAPDEGhuND/ijuxX9xGP6SP78df3fJZ2EB56mEkrBLscQ
	 V04iLH/0EVbsVU42sZZtt1oa4DDR+CLyT9T+NuouxCfL18V/fP/WARKlJkFJ88qjvyrJA
	 eGvui4m25hAR//IebrgiLn56YxP7ZOnwWeOcRe05zCB/NKF4mAppq1KN8C/9RcRSWkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755817;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=W3YXc4flfavKkOHv3yE6fAQMhfmrXbMqvhEwp1e651I=;
	b=hzPvnfoEk8MB/fLtmNF/m4MZo2JJodFWexHyNGQjESylSluVGXYztFSq2bqGUaS+xxSK
	 /Cu5ACtKLrz8LHlIHiK/iKywVwdb3nxLR5r1v/XlT9uXUXSUrjYViUS/HCoPEFFkfK0z1
	 AldyNTQc/xHLhaW47ihNmVbTXjMFzQTpISzRo2VvH9QR6u0n0RNe5EtHF6LoiYVnaPC7i
	 mLB7fO2dgIdwArM3ck/GfeMzWppHGpUPAa1wzEKeVY7nBr1b1a3Jt+y9Kh6DQtD3F59D/
	 krX+RPur4Y0HtrPNNS8IgSHf5Ov4dSEMevzP3UBY8xkUqBecDxrkaWiDvxnB/qD0NPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BgItlTkN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C41606A31C
	for <chrome-platform@lists.linux.dev>; Fri, 27 Nov 2026 05:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BgItlTkN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FE01F00897;
	Fri, 27 Nov 2026 05:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795755816;
	bh=W3YXc4flfavKkOHv3yE6fAQMhfmrXbMqvhEwp1e651I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BgItlTkNUEg5pI46T6qUsNFglUbQnVO1kcCu7UUhN/NA+bxOj55i9F/6oVuXApC/R
	 QzgZ5vk4Qkv7M6TnnscQLSXjL71C/e3PjOkh+lZRlfvLNrYXbjAK2UFjyDVzvsdd0F
	 rF2IcLByr1iIpPHPOYQg6nxxZBTqMBhfdwGY8ul7gx3TrwLleoSzyhB/ROPVSzJMGM
	 wPbRz8uj3UPuJUxUDAOGvRUs2ACdaLLM8VTpDHdF8kvlOY9HANdAz0Yhkvi1lweP6X
	 +UpjLSeJ4pYaQ1aTmkunEjKPAHiEOVisuwGuS4PLpb7vV7Rvmcv+c2t+s4CgczOHY7
	 WUQpLrvnFmYSA==
Date: Fri, 27 Nov 2026 05:03:34 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/9] platform/chrome: cros_ec_proto: Harden query_all()
 and retries
Message-ID: <awkPJn3HleidL_ad@google.com>
References: <20261124082112.3361229-1-tzungbi@kernel.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124082112.3361229-1-tzungbi@kernel.org>

On Tue, Nov 24, 2026 at 08:21:03AM +0000, Tzung-Bi Shih wrote:
> This series hardens ChromeOS EC command transmission and
> cros_ec_query_all() against transient transport errors (such as -EAGAIN)
> and buffer reallocation hazards:
> 
> - Patches 1-2: Reset `msg->result` before each transfer and retry
>   transient -EAGAIN errors in cros_ec_send_command() and
>   EC_CMD_RESEND_RESPONSE polling.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/9] platform/chrome: cros_ec_proto: Reset msg->result before sending command
      commit: 5f50a34803977de7b17f9d34197f826a46768152
[2/9] platform/chrome: cros_ec_proto: Retry sending command on -EAGAIN
      commit: 93b99991f70808d732f941ea565b1fd5c3d71227
[3/9] platform/chrome: KUnit: Add tests for retrying commands on -EAGAIN
      commit: 66f00cf9a5be3deb85a9625184c3a621244f283c
[4/9] platform/chrome: cros_ec_proto: Reallocate din/dout buffers atomically
      commit: 2bb45a4c536133a829a058f664b4ccb17e43d6fc
[5/9] platform/chrome: cros_ec_proto: Guard protocol v2 fallback
      commit: 830537d5456f4905a12b57ad886f17b1e9d4ee81
[6/9] platform/chrome: KUnit: Update test cases for protocol v2
      commit: f3bf02d943f7848e69cabdef8bc67d75749aef8b
[7/9] platform/chrome: KUnit: Add test cases for protocol fallback
      commit: a666c89771d9594cbb62601fcb787758f3366934
[8/9] platform/chrome: cros_ec_proto: Propagate feature probe errors
      commit: a5bea50c86b51fa4eeda3eee4914228e30cfb88b
[9/9] platform/chrome: KUnit: Add feature probe unsupported tests
      commit: 80f94fc7da85468940f9d8b919723db744aa7d3c

Thanks!
