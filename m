Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6555EE94
	for <chrome-platform@lists.linux.dev>; Thu, 14 Dec 2023 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jQUedh15"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d04c097e34so6673865ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 14 Dec 2023 08:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702571718; x=1703176518; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=luawVzpNb+QxL668ocEaZVPjlwFQcIxmSlMsAYgwWS4=;
        b=jQUedh159KZWctOwwEjie8Ejvf9ACLdCNaeF1nGyzgHE/i8czq9S1rrsj0HFnL5hl0
         369TBv+6nwdQd050p65gjoLsBkcjhnVv2NkElhVXh4zeY7kPSJPVIJVt2Bztw98hx6F1
         LXi6w3IwKPO5/qnfETe75DTfcq5wfAG9mrK4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571718; x=1703176518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luawVzpNb+QxL668ocEaZVPjlwFQcIxmSlMsAYgwWS4=;
        b=mKFzDWyIAREf7oflSB7zqgYmURd3eXyndgRdLVqxz2bMH0Ja9PfrYOyVBsUDb8lis7
         DVFveL+c6vNIzx1EXdzUgCUYUvvVz5pEbVFU3SPwKuZiGwDBQH7Q5cV/Ze/rzVpRTWMQ
         xWEfO7W3dfBpX/EKAnswlhFJNNVr5/OBuoW8+Hl+nRAAJkWEamOV2yX+WhqXJ2+HyGwG
         FazWNHYWLzPuvlUZAXiZGe87syNiyUplGFIYpsW85JjILDYEtq1rfYN9OuAh8hQWJYWZ
         A9xsjux7B9oCwS+QYyDH1VQL1Y+yob8mb7KXCr/Q1fsHotFr9DDMZoQQjrYiPwNJOxJZ
         BIoA==
X-Gm-Message-State: AOJu0YyExuGIjqSZqXmomV99TBcJ6JdrJxYzl/PV9Yhj4YN9YlEDbsQ8
	Qs/sUgaC9lBv4mahrj2S5fCmCQ==
X-Google-Smtp-Source: AGHT+IGMWhJzEdepoAGmiKRWvixiMXZQ5VqwgLuRg6NDcnO9mPPEhzlmlU+yN2Yxf/7Q1lbZjCM1dg==
X-Received: by 2002:a17:902:f283:b0:1d3:3676:c9d with SMTP id k3-20020a170902f28300b001d336760c9dmr4808777plc.19.1702571718563;
        Thu, 14 Dec 2023 08:35:18 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902d48200b001cfb4d36eb1sm12611665plg.215.2023.12.14.08.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:35:17 -0800 (PST)
Date: Thu, 14 Dec 2023 08:35:17 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] platform/chrome: Fix -Warray-bounds warnings
Message-ID: <202312140830.953C55AC9@keescook>
References: <ZCTrutoN+9TiJM8u@work>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCTrutoN+9TiJM8u@work>

On Wed, Mar 29, 2023 at 07:54:02PM -0600, Gustavo A. R. Silva wrote:
> GCC-13 (and Clang) does not like having a partially allocated object,
> since it cannot reason about it for bounds checking.
> 
> Notice that the compiler is legitimately complaining about accessing
> an object (params, in this case) for which not enough memory was
> allocated.
> 
> The object is of size 20 bytes:
> 
> struct ec_params_vbnvcontext {
> 	uint32_t                   op;                   /*     0     4 */
> 	uint8_t                    block[16];            /*     4    16 */
> 
> 	/* size: 20, cachelines: 1, members: 2 */
> 	/* last cacheline: 20 bytes */
> };
> 
> but only 16 bytes are allocated:
> 
> sizeof(struct ec_response_vbnvcontext) == 16
> 
> In this case, as only enough space for the op field is allocated,
> we can use an object of type uint32_t instead of a whole
> struct ec_params_vbnvcontext (for which not enough memory is
> allocated).
> 
> Fix the following warning seen under GCC 13:
> drivers/platform/chrome/cros_ec_vbc.c: In function ‘vboot_context_read’:
> drivers/platform/chrome/cros_ec_vbc.c:36:15: warning: array subscript ‘struct ec_params_vbnvcontext[1]’ is partly outside array bounds of ‘unsigned char[36]’ [-Warray-bounds=]
>    36 |         params->op = EC_VBNV_CONTEXT_OP_READ;
>       |               ^~
> In file included from drivers/platform/chrome/cros_ec_vbc.c:12:
> In function ‘kmalloc’,
>     inlined from ‘vboot_context_read’ at drivers/platform/chrome/cros_ec_vbc.c:30:8:
> ./include/linux/slab.h:580:24: note: at offset 20 into object of size 36 allocated by ‘kmalloc_trace’
>   580 |                 return kmalloc_trace(
>       |                        ^~~~~~~~~~~~~~
>   581 |                                 kmalloc_caches[kmalloc_type(flags)][index],
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   582 |                                 flags, size);
>       |                                 ~~~~~~~~~~~~
> 
> Link: https://github.com/KSPP/linux/issues/278
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

This patch seems to have gotten lost? Looking at the conversation, I
think it should land as-is rather than changing the allocation size.

I can pick this up via my tree if that helps...

-Kees

> ---
>  drivers/platform/chrome/cros_ec_vbc.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform/chrome/cros_ec_vbc.c
> index c859c862d7ac..b5a584f5469a 100644
> --- a/drivers/platform/chrome/cros_ec_vbc.c
> +++ b/drivers/platform/chrome/cros_ec_vbc.c
> @@ -20,10 +20,14 @@ static ssize_t vboot_context_read(struct file *filp, struct kobject *kobj,
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
>  	struct cros_ec_device *ecdev = ec->ec_dev;
> -	struct ec_params_vbnvcontext *params;
>  	struct cros_ec_command *msg;
> +	/*
> +	 * This should be a pointer to the same type as op field in
> +	 * struct ec_params_vbnvcontext.
> +	 */
> +	uint32_t *params_op;
>  	int err;
> -	const size_t para_sz = sizeof(params->op);
> +	const size_t para_sz = sizeof(*params_op);
>  	const size_t resp_sz = sizeof(struct ec_response_vbnvcontext);
>  	const size_t payload = max(para_sz, resp_sz);
>  
> @@ -32,8 +36,8 @@ static ssize_t vboot_context_read(struct file *filp, struct kobject *kobj,
>  		return -ENOMEM;
>  
>  	/* NB: we only kmalloc()ated enough space for the op field */
> -	params = (struct ec_params_vbnvcontext *)msg->data;
> -	params->op = EC_VBNV_CONTEXT_OP_READ;
> +	params_op = (uint32_t *)msg->data;
> +	*params_op = EC_VBNV_CONTEXT_OP_READ;
>  
>  	msg->version = EC_VER_VBNV_CONTEXT;
>  	msg->command = EC_CMD_VBNV_CONTEXT;
> -- 
> 2.34.1
> 

-- 
Kees Cook
