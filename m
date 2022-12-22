Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D526C15A9
	for <chrome-platform@lists.linux.dev>; Thu, 22 Dec 2022 01:53:23 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id r18so391732pgr.12
        for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 17:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIkct3ZfSboStP8z3R6ybBFElc9FQkJ/iv0LTePN+2I=;
        b=6GCzxC9SHk6Uyy1tXgHXC2yL2d/TzID4JshKxXfbNzUqY+PZJuPxW4qkbHLtGwHXlN
         XKXTxrDqEcXMMpHue8kn9RirQxNfh4xIXu05nIeChdHxsfWugAm0uvt517tBMsFgVBEh
         7yPlXe3OKu+7jdNKJpEKswfbyxRdbZSaIMO46/IANdBtSP465SF+Yz7CwPqWb4DWyNqu
         Y7WyuZYIfKH/igF8UuBaiPoAANHNfXRCSTLwwxNTsJ8pFNlYBIjE0bnk3trdsNJqHmVq
         pPSPlLCKPKhMZd/hHY+y4mO94gsFmrA5PqfD4OajEdpDSCltU/wrUBsw7fDc87k2JPKz
         z4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIkct3ZfSboStP8z3R6ybBFElc9FQkJ/iv0LTePN+2I=;
        b=pY1hpitDeHZuc+dfu58NuJ+z0ld7cq+ewjs50tsQsvSmpXXCqIBEwBy/Xb1RIJ39OM
         XoFz1bbkme9RDT2LZoJa3312abR9JXsfEAES3x9GEoUDzo9He+5w5sODhPz/iC1gPvo2
         QOSFjb76uzDYTk17+EUNsIdxZWJBGWIUimXVuqeajkobSDNYy0ZUjc2cVwdrqxMg+bN0
         KyIrNWEkgMHhXnlhR4BAVG70lVDHzzck6Tsp9/TItDubEjSbkCDgD9VkD0nVN9+vMw4R
         DaElH3E8B3ke4Iij4sw8NdIlKjqwzUTZxPnqJTv5dUDrueqOPjMlo/rhycusm8dMmNtL
         hY9Q==
X-Gm-Message-State: AFqh2kr78+vwb9ftb2IiecTdE+76c82jKBau7mK0pKxeM6J3TDPSNuuB
	GHHmVB+but0E9dOqDxy1GYoilw==
X-Google-Smtp-Source: AMrXdXvrYuTFH3qSlP667iS3ZQJNEqaSJAAWY0j67aUM+W3yzV06OOh6OREykNkcmxaHsyBd7nDV0Q==
X-Received: by 2002:aa7:81d4:0:b0:56e:a7a7:35a0 with SMTP id c20-20020aa781d4000000b0056ea7a735a0mr4287219pfn.25.1671674003222;
        Wed, 21 Dec 2022 17:53:23 -0800 (PST)
Received: from ruihai-HP.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id 12-20020a62150c000000b00574f83c5d51sm11202517pfv.198.2022.12.21.17.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 17:53:22 -0800 (PST)
From: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
To: pmalani@chromium.org,
	bleung@chromium.org,
	groeck@chromium.org,
	knoxchiou@chromium.org,
	weishunc@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: deferred probe when typec count mismatch
Date: Thu, 22 Dec 2022 09:53:19 +0800
Message-Id: <20221222015319.29142-1-zhouruihai@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com>
References: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

> Sorry, but I agree with Guenter; I don't think this is justification to add a
> hack for 1 board in this driver.
>
> In what situation does the EC task take so long after reboot that it
> occurs after a module probe (which occurs shortly after system boot up)?
>
> Why is the "corsola" board increasing the Type-C port count dynamically
> after some delay, and what is that delay amount? Why can't this be set
> via CBI/DT or its equivalent on your ARM platform?
>
> This seems like fragile code in the EC and should be fixed there. The
> number of Type-C ports reported by the EC really should be invariant
> across the boot lifecycle. I don't think this patch can be accepted.
>

Alright, I got it. Thank you for your patience and the suggestions.

Because the tcpc/pd tasks are not needed for the HDMI port.
The EC don't want the tasks initiated on starting up, and increase the
counts after the tasks are launched. The delay amount was 2 second before,
(always failed when ec reboot on firmware normal mode) and change to
1 second later, and 500ms yesterday(not reproduce until now).
The delay on EC can be referred to here [1]. However, with the current
design, the number of type-c ports reported by EC isn't invariant across
the boot lifecycle. Also, maybe printing the counts getting from EC
when encountered this field will be a littel helpful for debugging. just
an insignificant thought.

> If you really need to change the number of ports dynamically in the EC,
> add a board specific-hook to not respond to the EC_CMD_USB_PD_PORTS
> host command until you have "set" the number of ports.

Got it. Thank you again for your suggestions.

Link:
[1] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/zephyr/program/corsola/src/usbc.c;l=222

