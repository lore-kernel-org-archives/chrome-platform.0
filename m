Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7E5123C
	for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 17:11:33 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-65b2463d651so33548336d6.3
        for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 10:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695921092; x=1696525892; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad6GXmCMMLGlA/s915WQkLBQI5kRAuCS5UswE60HNfI=;
        b=ZgC5OXXCfZxEg4MohVZvCQAOhMO9HZzfp9iKm6Y+YqBUqI5q/o5gt1aWJqD2f5sRmX
         xBCJKUlXmliGJgmXwWyHDoO+tImjZDpSQ587Kk9W9qyJwdL5qujqqkPQ1ivT8zCI5ytY
         rOxGlQa4nFAbGvtJ5fvci+8G/MiDHDsiS+rrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695921092; x=1696525892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ad6GXmCMMLGlA/s915WQkLBQI5kRAuCS5UswE60HNfI=;
        b=oRrUQDlbJVZqH3FurVx8zwp9i87DgwDXykNB632dQVV+0DUMVIias33oagKYHM6Ht7
         QgQVAIz/TqMtUZQPzXHzmXEuEcFBYgWzx0gxrZu1yqRG6KUCPV9EfeNM8B4sudNPzuAP
         GmL/D0IELj1qcQej3AXoOR6MdwJpuPOIHRgFBSdQKwJP93joc7jSTPpuBLdAnx7CGRgG
         yXROZyKdripFj5qjCtC+eleZZS4TkaWy9sHAmf8eSQBfr+sJRGIJ/0cNmeNflzPKs3G9
         M496m2ToeAXmcxkS0ifKWyx0/lgpAoEMztjNL7fX3lTOIII32WUMYjCzRmSEqWd1Q2IZ
         QhWQ==
X-Gm-Message-State: AOJu0YxOxyqEGQftemSCbzWC0uclFhCVneXj+ltyPnijzVzLT9rS2I1K
	fZM6kgRG7Nn3D1apqJXPzlRx9Lr8cahWHWRrHyCoMw==
X-Google-Smtp-Source: AGHT+IHesZpiVMVGppRM5sZGX1k8dAYc8NbOshqx6ZWg4hpnRK2dL3bBByRuZLAHM7JVHkxI33vZnAXSKsbJODPG+W0=
X-Received: by 2002:ad4:4f04:0:b0:64c:9d23:8f55 with SMTP id
 fb4-20020ad44f04000000b0064c9d238f55mr1744028qvb.58.1695921092168; Thu, 28
 Sep 2023 10:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230927081040.2198742-1-u.kleine-koenig@pengutronix.de> <20230927081040.2198742-10-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230927081040.2198742-10-u.kleine-koenig@pengutronix.de>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 28 Sep 2023 10:11:20 -0700
Message-ID: <CACeCKacb0+zKuMFTMnqeSD2DRFd-K=v9+iU2tvLjj9QyeEiRrA@mail.gmail.com>
Subject: Re: [PATCH 09/27] platform/chrome: cros_usbpd_notify: Convert to
 platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Wed, Sep 27, 2023 at 1:10=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Acked-by: Prashant Malani <pmalani@chromium.org>

BR,

-Prashant
