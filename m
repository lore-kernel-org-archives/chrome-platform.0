Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32F55CD06
	for <chrome-platform@lists.linux.dev>; Thu, 14 Dec 2023 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aR+VqAD0"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ceb93fb381so676889b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 14 Dec 2023 08:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702571835; x=1703176635; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ytGugjo0G0b+BPvqCI62+RFEO79iMDy6vjEWkwFFqNo=;
        b=aR+VqAD0ywB+oJGxnvwDckUm98J8TgIUu3qd7EZ8lt58HDER9Vjr6IW0eD6HYsapVy
         KG2E30EEMF1xSP+KQUuyqXmCX3jNs+1HGZcR1mVhmmhyxuKr3kl0EvvoOCnjtF04wqCY
         QnlnIK/q99UhsAqWqslYP6hMfZ4uwHQDqAkFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571835; x=1703176635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytGugjo0G0b+BPvqCI62+RFEO79iMDy6vjEWkwFFqNo=;
        b=ku5WgDNtqUvugla+/9ZG3k6eN/Uk702JcvWiiKlLxtpyD0UcDUAOR1L74ZFmks0v0v
         Y/gI8FcyKN+YWivc3re7JJ3OdkJZI9Reav0jqjxjVDSesbdfQ4k9RqGmvqXWAp2rr/vp
         0vmsUms0zUFHpdfZKkdegy1b7moeE9Dgmk1AAFjVvjC680ohv5bFQ27X28kQs3mJbxMy
         yJY6V0J4Vu+RSxb6rWoSWJ8WG8fqM8rrpRiF2YaXAWxskoc0USb9m6Shp1nbPHmrbEK2
         w31MWZjR/LBMJ9LQlD73zlGEnKPfvQaJx6a0Q+l4QqnTmG2UUpy7zFRMgBnrIL7kL9Pf
         jsEA==
X-Gm-Message-State: AOJu0YwhHpAfhRGNgXsKhKalyU/a+/UJC0Lv7pWyvK+6l6FkIQTHRweD
	YNri6GrTjrHQkH2DsoFlZZjPug==
X-Google-Smtp-Source: AGHT+IHCcgxq6RgAT4BqOXPUetDHHLYdNS0fny6BFi7+klsE9cZ2F0ubu4OKof7NjbKXCrj/xdfJ9g==
X-Received: by 2002:a05:6a00:2d9e:b0:6cd:fda4:b57c with SMTP id fb30-20020a056a002d9e00b006cdfda4b57cmr12902654pfb.15.1702571834799;
        Thu, 14 Dec 2023 08:37:14 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gx4-20020a056a001e0400b006cbb71186f7sm11945039pfb.29.2023.12.14.08.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:37:14 -0800 (PST)
Date: Thu, 14 Dec 2023 08:37:13 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] platform/chrome: Fix -Warray-bounds warnings
Message-ID: <202312140836.5AB528D54F@keescook>
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

FWIW, I think this is the right change that disrupts the code the least.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
