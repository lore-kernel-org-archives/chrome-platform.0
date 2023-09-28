Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79435123C
	for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 17:10:31 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-45274236ef6so5861142137.3
        for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695921030; x=1696525830; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwI/pWHHt3c6ousus3HY74F/tUTyUgVMaKzFQON1XhU=;
        b=Gi+4sTaLGCDZtM/xMKucLBF7otC8EUgw7HohPUuRueym8Lm3qDtWYVK92XkezP31ka
         sxHoMAtdTKgqfZCNHCrPKs1y+re/ZFe5lmMcGHuZRS3dn6tlTX6k41m6W9BbmklqXx1m
         M3ZVnVHYNkFoGY3wZwXUiGC5jpeIjQGbXRtWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695921030; x=1696525830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwI/pWHHt3c6ousus3HY74F/tUTyUgVMaKzFQON1XhU=;
        b=NvsTzpzQRCWMozewh56BlPanH4T0mjDOgCqYAWqx+CbngZlraXRjUnJkNrkzPB68sp
         3n4vbMdWLiP3FfRrv/EfetgyZr+WaK9jWZynQTCbOBWPmrkNfaKDe4MPW0P2pH1QVJ1J
         I3h7CXftiG6GrlfEU5/AvKy1W9MyASMnQC2h6qcSc3qJA66CEjbYyNihE8dQ4K7A3JX5
         ellATAb5PDukAfEiq9gtEoCgQVC2G7TCYwXEKU22pzvh5bkZZHmnOUEqBZwkPUV0qM33
         e1MBud6kruHp1VV4KHRCd9js37zsOmTA/dc/JnPlgfj6oUwQARCObWeDLwpB7sOZms1k
         fqgQ==
X-Gm-Message-State: AOJu0YxKBerqkT9upNeVnLdqCctqDVwsODgtd/OQ1cCCadgn80dBvrW9
	Qei4Z/PfZbDPrSQKKT2dc4zUAQvXsqC9w03LMSgQoA==
X-Google-Smtp-Source: AGHT+IE17jAVF0w1soiVJOQKNrGSpb7KUe+bYLEd88iRVMjflNPYirtHKlvNR2nEJbQuNcNHrxnC+wkZXFTAHhHhy4A=
X-Received: by 2002:a67:f50a:0:b0:452:55f5:55e9 with SMTP id
 u10-20020a67f50a000000b0045255f555e9mr2031564vsn.14.1695921030478; Thu, 28
 Sep 2023 10:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230927081040.2198742-1-u.kleine-koenig@pengutronix.de> <20230927081040.2198742-8-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230927081040.2198742-8-u.kleine-koenig@pengutronix.de>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 28 Sep 2023 10:10:19 -0700
Message-ID: <CACeCKafuji+G_pn+A=9qUGRcSLS3cWeVYbVr85ZoHGvSUXKaoQ@mail.gmail.com>
Subject: Re: [PATCH 07/27] platform/chrome: cros_typec_switch: Convert to
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
