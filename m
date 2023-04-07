Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6540AFE7
	for <chrome-platform@lists.linux.dev>; Fri,  7 Apr 2023 21:54:20 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id a29so829465ljq.0
        for <chrome-platform@lists.linux.dev>; Fri, 07 Apr 2023 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680904458;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUf+hItRUlAyl8Odc+K+o9OQqV17J58V+aP3v0kFHhk=;
        b=HDRfRiwyLM/lRXtziEze5NRPh6rgRw/JeQ+qfRM5Cqn7guhS0gRrdgIW9xOpT8Raw8
         N+2IxIYkZudLJOb6CMyliOjZ092IoXrAieqLEVohPUzsgrFKfLb9g6iAhCLHgoq4qgY4
         QkgDhMcrq2aCU/C+7DEu248Jfb3qILitbqCwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680904458;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUf+hItRUlAyl8Odc+K+o9OQqV17J58V+aP3v0kFHhk=;
        b=qr/eWiAEotgFqqCf0Pb6szYSuLDvcIjvREyToj2+XaHEYu58kAlCBMPTGtyJzJAUJg
         0BzDTC/PIo8c/NdiDTM+OyFwyH75mz2mC2VmO2rysmm9x8mmIv9QagdMNEM/fRFyfIxF
         dvONTuiJpXPObTCc7U8K+aSyWwDYrkIdSYac1gZ0iajuL1JGhOCMmcP0xkatJAFbujnJ
         WyGcIj2y8p2gghDCljPBo3to/56+iXmw7njmfJqm0PQvez2a2l3HOehrVNVvkGzYJEem
         xgVsOtRIDBjVbnDpdxAjANqXk0QtRNzfX5qmQ0dYMDO9PKmuHx+ZrmbvPzaazp9V5ecy
         mYPg==
X-Gm-Message-State: AAQBX9dsLYjHLOHzG0/zQbw2QQ/1X6Q6mFpCV9K8HOowxa7qgYOUqCgf
	Vb5kDXJk5B0xQO6dt1SXv0ZFDTv48ni7Olpw308rOA==
X-Google-Smtp-Source: AKy350bK2tfa/ifMpJd99S5lA9yyNvRN8J9D6TZLrauRv7sSWhzgZZFM6h20BylS5hhLgn59vMCdcBgqoUJ4xAgeXvY=
X-Received: by 2002:a05:651c:1035:b0:2a5:f6f2:1ff4 with SMTP id
 w21-20020a05651c103500b002a5f6f21ff4mr917513ljm.10.1680904458705; Fri, 07 Apr
 2023 14:54:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Apr 2023 14:54:18 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230331091145.737305-2-treapking@chromium.org>
References: <20230331091145.737305-1-treapking@chromium.org> <20230331091145.737305-2-treapking@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 7 Apr 2023 14:54:18 -0700
Message-ID: <CAE-0n53Dw1tk0vVuToTwGYrKD76O_F97QgSGricBuvuPJnG60g@mail.gmail.com>
Subject: Re: [PATCH v15 01/10] device property: Add remote endpoint to devcon matcher
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Daniel Scally <djrscally@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pin-yen Lin <treapking@chromium.org>, 
	Prashant Malani <pmalani@chromium.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Xin Ji <xji@analogixsemi.com>, Marek Vasut <marex@denx.de>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lyude Paul <lyude@redhat.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-acpi@vger.kernel.org, chrome-platform@lists.linux.dev, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Pin-yen Lin (2023-03-31 02:11:36)
> From: Prashant Malani <pmalani@chromium.org>
>
> When searching the device graph for device matches, check the
> remote-endpoint itself for a match.
>
> Some drivers register devices for individual endpoints. This allows
> the matcher code to evaluate those for a match too, instead
> of only looking at the remote parent devices. This is required when a
> device supports two mode switches in its endpoints, so we can't simply
> register the mode switch with the parent node.

Looking at this in isolation I have no idea what a mode switch is and
how it is related to drivers/base/property.c. Can you expand on this
commit text? Maybe say two "usb typec mode switches"? And maybe include
an example graph node snippet?
