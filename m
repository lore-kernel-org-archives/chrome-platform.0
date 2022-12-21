Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBB31FA7
	for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 07:01:26 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id w37so9830612pga.5
        for <chrome-platform@lists.linux.dev>; Tue, 20 Dec 2022 23:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8lfguS/R5l28BwM1JLclRJo0wooyg7ZgG8Xn7e24+VI=;
        b=ZbmmtNu8a3wKgraC7xoKXpRzifobRRXlPtRmmIamt23dMBiHMD8Wm6Mmg1sSqRt3i4
         bY0bY2Nn2MPqG09SP3iwcUryZeEGFBIOM8vjp6pqiMCUdp1ajYYXMam8mqM+2F4Cf/cM
         YqJmHFVhvtp00Dz1qIMvOQ5YN+5pFbafQpTcx6DJqx0z0SsGKuYM8yQewO4mkzIcwO/D
         04xReUcx4cq4FcyBvYMSfr5lldk9V3Hg6Z6ilkxu6ltT3uaTGYUVsYBaN4YCRKr0yJP/
         pkJ2JMyEaGuixvEC63jHEVhfC9kT9MnEU3ECrx9MqUEampMy71kxiJ5mx/LZyXR5KKhx
         7Z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8lfguS/R5l28BwM1JLclRJo0wooyg7ZgG8Xn7e24+VI=;
        b=1aMLCGUGV3FpcqpujfoO3jEaf9caid5cNRtF3nYJ+LvS2Ssz1JVFsGYLUyZLpheyZ0
         9pKjLdsYj5jpmKcOSXv0GprTL2vj5ilQslLj78XW0nB6/1Ot/Rz+QzjBda4ir3miiDiD
         LK5NbRc0ask0Vvf8E9n6AqtpSTA0DaIxxlXofOdFrOcDyhdyy99ym6eel2NpAhlqoX2m
         1ZGyNn20+JieWDCxcW5IIFP3CIR7bfoYJ+3IJKbReH38g6U8Q2ycXPPQkItQ+kjiupda
         XiIcsjttTgXpkPafaqW35LT9SSI+88O5qZQhY9neVkca0speNYR+cSiqfBF/LHK3fIhW
         vRcQ==
X-Gm-Message-State: AFqh2ko3Vu0U7IbyZLlJm0ikAFEN7idPu5W9+QHIhTVamoAsm1jrW3pK
	GgWRV+a0yg1iq/FdIA/5skNQfA==
X-Google-Smtp-Source: AMrXdXsH8jXt5lg4cvAsxJmJHCaYs84T0CQiR8wx0+o8cKnHDmqITkMzaPJurdtAART6DPwpTNnP8w==
X-Received: by 2002:a05:6a00:124c:b0:577:753a:6af with SMTP id u12-20020a056a00124c00b00577753a06afmr1302452pfi.31.1671606086156;
        Tue, 20 Dec 2022 23:01:26 -0800 (PST)
Received: from ruihai-HP.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id f185-20020a6238c2000000b00575b6f8b84esm9772567pfa.26.2022.12.20.23.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 23:01:25 -0800 (PST)
From: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
To: pmalani@chromium.org,
	bleung@chromium.org,
	groeck@chromium.org,
	knoxchiou@chromium.org,
	weishunc@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: deferred probe when typec count mismatch
Date: Wed, 21 Dec 2022 15:01:22 +0800
Message-Id: <20221221070122.4167-1-zhouruihai@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com>
References: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

>>> Is this really seen in the field ? The EC should never report a wrong
>>> (random) number of ports. If it is not ready, there should be _some_
>>> indication that it isn't ready. Does it really report a more or less
>>> random number in this case ?
>>
>>  Yes, I saw this on corsola board. The EC report a wrong number(not random), because corsola emulates HDMI MUX over the current
>>  type-c mux stack. The ec has to fake a type-c port to pass the MUX info. But the task are not initiated on starting up, and increase the
>>  type-c port counts after the tasks finished. In this case, I saw the typec->num_ports = 1, but the nports = 2, which will be probe failed and
>>  block the HDMI mux function.
>>
>>  I will send v2 patch, if nports > EC_USB_PD_MAX_PORTS, then return -EINVAL, but if nports > typec->num_ports, we consider wait a second
>>  to ec task increase the type-c port counts if there're a HDMI DB attach, then return -EPROBE_DEFER
>
> The current code just reduces nports if it is larger than
> EC_USB_PD_MAX_PORTS. Again, I don't see a reason to change that.
>
> Anyway, I am not sure if the above will work reliably. I am not sure
> what "HDMI DB" refers to, but if it is an external connector its
> status could change anytime. In that situation, no amount of waiting
> would help. Either case, the EC on corsola should really not change
> the number of ports it supports. Either it is a constant that should
> not change, or it is dynamic and the EC would need to tell the host if
> the number of ports changes (up or down). Trying to fix this in
> cros_ec_typec without well defined protocol exchange with the EC is at
> best a kludge, but not a real solution.

Thank you for the reply. The "HDMI DB" refer to the daughter board
attached to the mainboard, which don't change anytime. In fact,
the corsola EC increase the port count dynamically with some delay
(no see a standard yet) during bootup. There is the EC code to
increase the port count [1]. If the cros-ec-typec get the type-c
port counts from EC before the EC increase the port counts, then
will probe failed if return -EINVAL. I think the cros-ec-typec
is replying on the fragile delay in EC, cros-ec-typec module will
not get the fake(HDMI) type-c port counts once the EC deferred
call is later than the driver probe. That is why I make this
change. For the verification, the driver always probe failed
when EC reboot without the patch. But the driver probe passed with
the patch after a few times deferred probe.

Link:
[1] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/zephyr/program/corsola/src/usbc.c;l=47
