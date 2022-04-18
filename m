Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010FB3D61
	for <chrome-platform@lists.linux.dev>; Mon, 18 Apr 2022 23:29:16 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id t15so8739642oie.1
        for <chrome-platform@lists.linux.dev>; Mon, 18 Apr 2022 16:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=fnGr53ll8S7dG883IEeM0scEHRuR6/64FgMBnWIr8nE=;
        b=R+chdkm07WDUmBdNNWTZY4DCcpGBLLK3l1gkE7+beL5tg8tEW0mNPAJlfv3h6VpRqa
         hREevAo2QcF6sO51GnlLz4jjZNvnHfFK7/vz7FgDeiHcJ7ydpJYnIfuIXIdiMO+Uyk9O
         QwXUUDnQ5rMWI5yTPpRQYpi0oXzKIwWfzc4BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=fnGr53ll8S7dG883IEeM0scEHRuR6/64FgMBnWIr8nE=;
        b=EZmLp8xn5iRavxIa3Zy84RZEvRwdjUl4QgTRydXGbEcftC4f5FARgtVw9NTGWGMKTj
         e8jZJ5fGU94iSKfhoAMfWetvcFZEy8C24dsN7zYd8g71ENACQBBkncg4T7MmhrHbAqQJ
         0ITbTdED8XB+rJ31A/l6aEGrf0TU+tAvk90UILQt8Gr/OLj+JKifbh4oW50ecxm7P8W+
         fwP7jcFXnxPJipyrf3Taj0vLTTkEyceWt6mABsy+wBmATd58uRkUODhDMw2uZZk6YIEI
         W6r42l5YXIWVzZvkmliLOQECJbvBSKFzH55qBqOPiLN6eR10DJDFUROHp6BDA3nd9xnm
         YePw==
X-Gm-Message-State: AOAM531pxfoH1zCWhSolAFBbtgYEb89ifp24q3i2lbgonw9EOxjyUarl
	wcF0nWFQIH7PhqjS/BMOKG7TbZS5BIFdv2Y0X1gMLg==
X-Google-Smtp-Source: ABdhPJxMMIspQN15t5a3pLyxGSFKCn1ePl9kulWUC69ipdxaKBN7DSnhvNpkkFk0BeDV4jrv9qJGDAXy3HuVcYX/MUU=
X-Received: by 2002:a05:6808:10d4:b0:2fa:5fa6:e9c4 with SMTP id
 s20-20020a05680810d400b002fa5fa6e9c4mr5863218ois.193.1650324556139; Mon, 18
 Apr 2022 16:29:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Apr 2022 16:29:15 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Yl3ykMvfCaQlQ7t9@chromium.org>
References: <20220415003253.1973106-1-swboyd@chromium.org> <20220415003253.1973106-2-swboyd@chromium.org>
 <Yl3vd4kfgwJXMs/w@chromium.org> <CAE-0n53N1k_b9vWJ84nBdm9sxpYV3o4-FLJQM1HGqEhQsdr19A@mail.gmail.com>
 <Yl3ykMvfCaQlQ7t9@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Apr 2022 16:29:15 -0700
Message-ID: <CAE-0n51PX1SgqiB5vgoOLunkrxiWxH2O=jCCM5gNL97O8Ltt4Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform/chrome: cros_ec_proto: Add peripheral
 charger count API
To: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Lee Jones <lee.jones@linaro.org>, 
	Daisuke Nojiri <dnojiri@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Quoting Prashant Malani (2022-04-18 16:21:52)
> On Apr 18 16:16, Stephen Boyd wrote:
> >
> > Sure. I take it that I can drop this function entirely then?
>
> Yeah, if it's a simple response, should be fine.
>
> > BTW, why is
> > that function name the same as a struct name? It confuses my ctags.
>
> Yeahhh, didn't think about ctags... :/
> Topic for another series: probably can be renamed to cros_ec_cmd() (just to keep ctags happy) ?
>

But then there'll be two cros_ec_cmd() because there's a
cros-ec-regulator. Fun! :)
