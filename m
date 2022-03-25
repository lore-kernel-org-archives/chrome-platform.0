Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F74123DA
	for <chrome-platform@lists.linux.dev>; Fri, 25 Mar 2022 15:40:34 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id t21so3652475oie.11
        for <chrome-platform@lists.linux.dev>; Fri, 25 Mar 2022 08:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=D+jLkCpaZNDCy/uHdMrqvNgmVKMmoKiEpprLxsWBcrk=;
        b=WBMTOJnlOcFnH70i8g1Z6BQViSEKTHEq/JyckGw+LCen6SAQFfxSLY90bsZOQGT++Q
         nPQ1kRnmegekXItS+NyN2cZnYsT4bcgYYUcAmvnTsFmmFyNWgFtPfCsf2CrfGmDnzHD7
         6GJhJIbuezWeKdL9cDaz14ZtbczF4ms9wTV7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=D+jLkCpaZNDCy/uHdMrqvNgmVKMmoKiEpprLxsWBcrk=;
        b=oR7tdKgwP8621NbPHoEJWDcPFU8YJPaKQ41QyZoFxF/jTK4g0sQCWckVShMyw45QQm
         huBU+SmZvUoY2DbqEREwDj/AnegNRJwFkXLvrM85J48AIS+yfUa9WjkRK/KUwrmBpVsg
         PjO/RpWxo8U0An02wwxW4hxRwz0gqsoHjBjfDt1Sn0e/qIMTFDVkneVugx4tk7CXd0np
         qwxPqdXSXk7VE3TqKI2WxwUufYQsxoHaFDgZffdjYLka2HIxudWpTRvD5Z2/qNDJA+m4
         H4JhtEySjOsIB7v3FgD7kayTGnpHLs+uadyZZJrBMpqSzvecCp/RTH623HwW6eYKGwWt
         41Lg==
X-Gm-Message-State: AOAM530cJYkloq9u3ZM/525lwqV3a/nkm5u9yAqjpZOOIdoHe4TYkODd
	6pRLs46fAfho+ZZLP15wYrPkqnYprVHWK8ZsVNCt5w==
X-Google-Smtp-Source: ABdhPJzHLYq1n0oMw/ZrH7LYQF2eWCeFDmwwVx7wahLFhNpTjgHMpkRd/MVfGx7ajwKra2C02IMCHnunrXRCl3BK0Bo=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr5566847oif.63.1648222833524; Fri, 25
 Mar 2022 08:40:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 10:40:33 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YjknOFMere5DG5He@robh.at.kernel.org>
References: <20220321191100.1993-1-swboyd@chromium.org> <20220321191100.1993-2-swboyd@chromium.org>
 <YjknOFMere5DG5He@robh.at.kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Mar 2022 10:40:33 -0500
Message-ID: <CAE-0n532uGx+VstUEt9ZC+_6Tg6_HsaJAsKn1p02Q3qV9XqEPA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: chrome: Add ChromeOS fingerprint binding
To: Rob Herring <robh@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	Guenter Roeck <groeck@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Rob Herring (2022-03-21 18:32:40)
> On Mon, Mar 21, 2022 at 12:10:57PM -0700, Stephen Boyd wrote:
> > Add a binding to describe the fingerprint processor found on Chromebooks
> > with a fingerprint sensor. Previously we've been describing this with
> > the google,cros-ec-spi binding but it lacks gpio and regulator control
> > used during firmware flashing.
>
> Then 'google,cros-ec-spi' should be a fallback?

How do I describe that in the schema without causing google,cros-ec.yaml
to jump in and complain that there are unknown properties? Do I need to
combine these two schemas and then have conditional properties?
