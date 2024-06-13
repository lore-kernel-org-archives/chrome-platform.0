Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AF314D290
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 19:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306408; cv=none; b=C75zsd4jfb31J12bQLV9sMWHjGS6kmPo/3AhWvqc/9mwaequvDLUf/TlqAJoAfejW5r+tXX6R79ueYYwmarcOUfE/v5hHfFeXA/v3C4PfO52YgEHx5kxse6ewVcizdlxo4Z1xaGUoyL+Q4ZMSA3uBfYd+2DWJWhYRZo0xLp9rRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306408; c=relaxed/simple;
	bh=EyQ3hgLz0Dnk7ppR5oBQHpeY1aBrderyGlDfH/wRJIs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o7CFZV4iT7qh4opxF8unYWZBZo+7ctZhPyN3ZfpZCNlcpV+D823LWy8mwTWnRTHoWylHLQoPlov9v6hRxFx5+K3RIOAABBDXf3CZ9k24IzKYIyg2mk4rHoiH47qRtZ+mIEeU2S9I9jzZ5bFFSO22FlaWkgskS6e8Wo+W9QCBTSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jubnut.com; spf=pass smtp.mailfrom=jubnut.com; dkim=pass (2048-bit key) header.d=jubnut.com header.i=@jubnut.com header.b=VQKmOphU; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jubnut.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jubnut.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jubnut.com header.i=@jubnut.com header.b="VQKmOphU"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4W0XKs1C50z9sRg;
	Thu, 13 Jun 2024 21:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jubnut.com; s=MBO0001;
	t=1718306401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SzxVulY0TZcuW2PwYcIj3BXHYxEJ9lYYWUWQX+mmOOk=;
	b=VQKmOphU5q/qHxoGuXx5eJ+VkLPGjLUcXaWxSrzkfwQfkRgSdU2LoE7zC5eiQX0uA6XO0Q
	UOVBq3O8vvCEKVPFcbI6MyEtVlaDaQ9opyLHEPOS7FZFkG2N8Y50AIE1sMpkwxi02tD4CF
	IEXpb/ihxt2B0vRrDrPic0GPb4M1Vdfe39AzmPJ3LE/hWpq2xxRn97AH0vEFPmXM53e7Sc
	Lxj2omMcIE/zxGVnw/n2bZxn3b3YujgUSVfsZKw3wn5kOEReHcFN0+dX4ePNiebvOjVdkc
	ICKKr9oOj3uB+dJKu8kMkdCguKh9J0OcQqxWxCZlkpCfoKqGUrm+93qx5zuerA==
From: Ben Walsh <ben@jubnut.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Fix error code in
 cros_ec_lpc_mec_read_bytes()
In-Reply-To: <ZmsvHBrYSpwYLyxx@google.com>
References: <e0b43fb5-ecc8-4fb4-9b76-c06dea8cc4c4@moroto.mountain>
 <87sexgrdk4.fsf@jubnut.com> <ZmsvHBrYSpwYLyxx@google.com>
Date: Thu, 13 Jun 2024 20:19:58 +0100
Message-ID: <87jzisabvl.fsf@jubnut.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Tzung-Bi Shih <tzungbi@kernel.org> writes:

> Somewhere like [1] could accidentally get the -EINVAL.
>
> [1]: https://elixir.bootlin.com/linux/v6.9/source/drivers/platform/chrome/cros_ec_lpc.c#L232

Sorry, it happens at:

cros_ec_query_all -> cros_ec_proto_info -> ... -> cros_ec_pkt_xfer_lpc

        /* Read response and process checksum */
        ret = fwk_ec_lpc_ops.read(EC_LPC_ADDR_HOST_PACKET +
                                   sizeof(response), response.data_len,
                                                     ^^^^^^^^^^^^^^^^^
                                   msg->data);

>>
>> Dan Carpenter <dan.carpenter@linaro.org> writes:
>> 
>> > We changed these functions to returning negative error codes, but this
>> > first error path was accidentally overlooked.  It leads to a Smatch
>> > warning:
>> >
>> >     drivers/platform/chrome/cros_ec_lpc.c:181 ec_response_timed_out()
>> >     error: uninitialized symbol 'data'.
>> >
>> > Fix this by returning the error code instead of success.
>> >
>> > Fixes: 68dbac0a58ef ("platform/chrome: cros_ec_lpc: MEC access can return error code")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> > ---
>> >  drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
>> > index ebe9fb143840..f0470248b109 100644
>> > --- a/drivers/platform/chrome/cros_ec_lpc.c
>> > +++ b/drivers/platform/chrome/cros_ec_lpc.c
>> > @@ -139,7 +139,7 @@ static int cros_ec_lpc_mec_read_bytes(unsigned int offset, unsigned int length,
>> >  	int in_range = cros_ec_lpc_mec_in_range(offset, length);
>> >  
>> >  	if (in_range < 0)
>> > -		return 0;
>> > +		return in_range;
>> >  
>> >  	return in_range ?
>> >  		cros_ec_lpc_io_bytes_mec(MEC_IO_READ,
>> > @@ -158,7 +158,7 @@ static int cros_ec_lpc_mec_write_bytes(unsigned int offset, unsigned int length,
>> >  	int in_range = cros_ec_lpc_mec_in_range(offset, length);
>> >  
>> >  	if (in_range < 0)
>> > -		return 0;
>> > +		return in_range;
>> >  
>> >  	return in_range ?
>> >  		cros_ec_lpc_io_bytes_mec(MEC_IO_WRITE,
>> > -- 
>> > 2.43.0
>> 
