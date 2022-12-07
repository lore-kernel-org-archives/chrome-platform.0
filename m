Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CD81367
	for <chrome-platform@lists.linux.dev>; Wed,  7 Dec 2022 08:02:15 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id o12so12158574qvn.3
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 00:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w5fcjl3iXxwvf0nTzB6a96TQKeVskSzuKAx+3Sz7I0M=;
        b=eqtXjWjMQ25qJ2mOlMaqcvTcJZ7PaVUnh69+j8Txro/amqjy1lIQ8hNGkgzDrq7aIO
         vKXLMhmZchDWwzgfaBr/rXhoFkHt0ETeGv4//2ijgK1DKHijEimdtwWvG1sSxtqUbBXy
         Jyyx3FHG3lKqpaRCTN66FGOpvmShm+Xc/qh4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5fcjl3iXxwvf0nTzB6a96TQKeVskSzuKAx+3Sz7I0M=;
        b=QbVcM4htCMjSGFyd1h51C360yDgwa4MCExySWdgvSpc6zMfnG2ZB5RMR61UqjxPS/f
         9GB0G1x3y6yoZuTWSDrePWlVGQY1eLNoRCnNJpHHdunZFj0gPIFtt9F04C1gYm/db+75
         6J++LfC9z5vMQR9KMqQgekI+pvUewGFaQgXU5VlwmbsA76cfm4Q5ZOqhaqMqVf9QlMY2
         33JsUx8zmjNhJwFLiQxKuRHhA1iB1FLSxSC93ZJWnaMZiyGo/vesvePdE1Ap6obET3x+
         MakSsGER9nxNAGEItfJRfU2TjrhEIbqXqrU0EhzabtSeHiJdWnlwXo54tYwR+mcZ+7q/
         aqyA==
X-Gm-Message-State: ANoB5pkVdtv2eyfP1h1PMibCv8LAIt8XhXb5Fqs1gtTdU2bYhqWfl1AK
	2CYFR2x0lOT9BRfkPc/O6YmEBK2oIEwqbJiPq8rJoA==
X-Google-Smtp-Source: AA0mqf45GJw3kVfsNaKS+UFTth9dJVIhicBfSvEwAufgiuVCMV57UtcEJIUJSav4qeifsNX1wy2fXzy4dkueNvYp1KY=
X-Received: by 2002:a0c:ea49:0:b0:4c7:660f:1845 with SMTP id
 u9-20020a0cea49000000b004c7660f1845mr11563049qvp.73.1670400134636; Wed, 07
 Dec 2022 00:02:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221207040049.1.I1864b6a7ee98824118b93677868d22d3750f439b@changeid>
In-Reply-To: <20221207040049.1.I1864b6a7ee98824118b93677868d22d3750f439b@changeid>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 7 Dec 2022 00:02:03 -0800
Message-ID: <CACeCKads-Kwqr5iMj9=+ryXFiFnPoyNnhOuzpYspwKo5yP-+mw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: zero out stale pointers
To: Victor Ding <victording@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	tinghan.shen@mediatek.com, gustavoars@kernel.org, 
	sebastian.reichel@collabora.com, dnojiri@chromium.org, bleung@chromium.org, 
	lee.jones@linaro.org, groeck@chromium.org, tzungbi@kernel.org, 
	gregkh@linuxfoundation.org, dustin@howett.net
Content-Type: text/plain; charset="UTF-8"

Hi Victor,

On Tue, Dec 6, 2022 at 8:02 PM Victor Ding <victording@chromium.org> wrote:
>
> `cros_typec_get_switch_handles` allocates several pointers when
> obtaining four handles. These pointers are all freed if failing to
> obtain any of the four handles; therefore, pointers in `port` becomes
> stale. The stale pointers eventually cause use-after-free or double in
> later code paths.
>
> This patch proposes
Please use the imperative form [1]

> to elimite these stale pointers by zeroing them out

s/elimite/eliminate

> right after they are freed.
>
> Signed-off-by: Victor Ding <victording@chromium.org>
This should have a "Fixes" tag.

Best regards,

-Prashant

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
