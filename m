Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8251C26
	for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 04:10:55 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id bj12so33852233ejb.13
        for <chrome-platform@lists.linux.dev>; Tue, 20 Dec 2022 20:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mzx67yLOttbqOH0rGRIjrW4YxbQAYmEJCNbwtahfAIs=;
        b=Zi4+Y3LFrUE/QpUhGprR6trG1kxgqYCD+C+8VW5lmE6NfhhTaCrKaYE2DRkxvXHHYq
         Z3EnLxCis6VJ/TiXlflnT/8W5J64Z2PrhgVusB3wgQE/ML5H9ywJSvAqLSTj0CiUmMg5
         YRa/TV1UOVkRcLnv/2nfM1SaNTBBj5CnI8C7PFZKdjqzdTm+OwGr39H2Xwsmjy8esYL4
         mtbEK30/4ES1p49aYxOr4pBLp1qIcht6/RnoE49cXJRfXR9EgKV4bsNG6SBHHk9yacku
         X1vaZt8kIxeNAPmmXbuRfz+qzXl8jTkFVNpGdR+Drf/JGlT5kIZdCm8NvpVVom/92PeI
         dhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzx67yLOttbqOH0rGRIjrW4YxbQAYmEJCNbwtahfAIs=;
        b=HYxqsfenKWJnOp9OBGZJWiaMOGWAEhB1gbHAkJ2KIem40m6pdfFpsPbYyLy3EODQ9L
         U3Im7lGRJq4IPWzQzqPE1DF3LSjV055np/eNdex8YP1k4W3P4vaVjgmrR0iwOx9VdkUb
         9VcM2tGdK0GH1YnsTVI1sazmrW1ogKTpiS0cxfI/otD7nHLj0IevFJRdB+nFbl6Re/tU
         F5ENmRHIyV9hKRfCPvllfZEjfAKtWkeUTu2c+AarreYwtW103RgQ4x5LXcDy6y2UOOXD
         d2+V+0DdhjwlirxNVMOH4xnNIF04M9ukXmrUS5Mp7ydVHIrFTj6G1CpVWlI9I0iwQ13H
         lM9Q==
X-Gm-Message-State: AFqh2kr9sxGPJ1zTy2SZ+rONl12usPBaf+vcXrWm3kh1j6dpWUSaxKuQ
	B/VGcV+06NwQogVt9f3JCtSdSh2SaAsryKZzW1RC3g==
X-Google-Smtp-Source: AMrXdXt8SiUKTuYGaxNbOD3qA4B0tGD387SNw63q2+UTIi6JGiZULdL7LxyLVSHx9bk/S3K5GpAhTHh7/TLz23dPC+k=
X-Received: by 2002:a17:906:4bcb:b0:82d:1d5f:2618 with SMTP id
 x11-20020a1709064bcb00b0082d1d5f2618mr8070ejv.107.1671595853542; Tue, 20 Dec
 2022 20:10:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com>
 <CABXOdTeJuFn-23OiTshJTQWMBvkiqOXUh6S8z354eEPzj+q4Ew@mail.gmail.com> <CAFUSabk3Lut1sHXOQi=ArtS9BvyqZQcTawKBVHupRJt+zOVaMg@mail.gmail.com>
In-Reply-To: <CAFUSabk3Lut1sHXOQi=ArtS9BvyqZQcTawKBVHupRJt+zOVaMg@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 20 Dec 2022 20:10:42 -0800
Message-ID: <CABXOdTdt+iW5e6X1ZAKfqWdkdZOrQ0-5bLoJA8s8vBmSi7f9zg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: deferred probe when typec
 count mismatch
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
Cc: pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, 
	knoxchiou@chromium.org, weishunc@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 20, 2022 at 6:10 PM Ruihai Zhou
<zhouruihai@huaqin.corp-partner.google.com> wrote:
>>
>> I think that is problematic. It might as well be that nports >
>> EC_USB_PD_MAX_PORTS.
>>
>  Yes, you're right. so we should consider it's a invalid argument and return -EINVAL if nports > EC_USB_PD_MAX_PORTS. right?

Why ? While this would be a bug, it should hopefully be found early in
development and never hit the field. I don't see a reason for changing
the code.

>>
>> Is this really seen in the field ? The EC should never report a wrong
>> (random) number of ports. If it is not ready, there should be _some_
>> indication that it isn't ready. Does it really report a more or less
>> random number in this case ?
>
>  Yes, I saw this on corsola board. The EC report a wrong number(not random), because corsola emulates HDMI MUX over the current
>  type-c mux stack. The ec has to fake a type-c port to pass the MUX info. But the task are not initiated on starting up, and increase the
>  type-c port counts after the tasks finished. In this case, I saw the typec->num_ports = 1, but the nports = 2, which will be probe failed and
>  block the HDMI mux function.
>
>  I will send v2 patch, if nports > EC_USB_PD_MAX_PORTS, then return -EINVAL, but if nports > typec->num_ports, we consider wait a second
>  to ec task increase the type-c port counts if there're a HDMI DB attach, then return -EPROBE_DEFER

The current code just reduces nports if it is larger than
EC_USB_PD_MAX_PORTS. Again, I don't see a reason to change that.

Anyway, I am not sure if the above will work reliably. I am not sure
what "HDMI DB" refers to, but if it is an external connector its
status could change anytime. In that situation, no amount of waiting
would help. Either case, the EC on corsola should really not change
the number of ports it supports. Either it is a constant that should
not change, or it is dynamic and the EC would need to tell the host if
the number of ports changes (up or down). Trying to fix this in
cros_ec_typec without well defined protocol exchange with the EC is at
best a kludge, but not a real solution.

Thanks,
Guenter
