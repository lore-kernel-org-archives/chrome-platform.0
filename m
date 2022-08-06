Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842BD3205
	for <chrome-platform@lists.linux.dev>; Sat,  6 Aug 2022 20:46:19 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id t22so5655578pjy.1
        for <chrome-platform@lists.linux.dev>; Sat, 06 Aug 2022 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=YzqtcGqN0L2rq2pswMCoulyCAGZdtTSnYYDw0hYySOY=;
        b=Wn3k+xAUHbBzpeyRCFdNVhuaPNjc3Bil1+782KGI48yqMIUwUmq2ao9OEfA0MLBq/l
         Zi1FWKWmW2OmGbZidlaRGSdD41TOciU4lfXMfIU65o4Km3ih5OMQ+RSoveCBr1MAgcQc
         DlLu27kKVk6ugm18RL/KCSxoMi1t3u8naTkMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=YzqtcGqN0L2rq2pswMCoulyCAGZdtTSnYYDw0hYySOY=;
        b=vtr3zP4QYPAxaHZT0qhLbPvaHp46Woh00rfYo1M73T4GP6Iy/8GI+W4ckInYz8WlYH
         EbxGvZjxP7lZQCbPKPBxbCELbriRejtprSsanOp/8wcBUQiRaJ8jKFXuNAvtfh8hHyb2
         j4tKh3PFzNJmjAfociomTVHftHycoXqVL78sv6AvfDnsKYKsmElF5fXJ9i5/PrpdM/gH
         7Qiv9kg4WLJs/tOqPfQfc06csBNkDb7czveJoR9d2D8ui4mYccJQ9enYBZWlFA7t5yEP
         5BFBAPiWsfmIChwgOPxSvEf7gY/ltOiH8fVTIxlRSWSYwGlifNoJWbBjlLoNliHgJlWU
         40Jw==
X-Gm-Message-State: ACgBeo0BJpYrGgvN91UN33M3g592h3sStIs5ou8IyITLZU8i4y5N7BGn
	2opK2SZGYLFmJP1b6nYZ8dFRTQ==
X-Google-Smtp-Source: AA6agR52kGQIUMo1Zs7sRS09nHLKeqqWiI3gxI135mtBjyQIcpintCGliKMhlBJbs/F9/md7fC+I0g==
X-Received: by 2002:a17:902:d651:b0:16b:f55e:c626 with SMTP id y17-20020a170902d65100b0016bf55ec626mr12631018plh.78.1659818778882;
        Sat, 06 Aug 2022 13:46:18 -0700 (PDT)
Received: from chromium.org ([2620:15c:7c:200:43d8:ac7e:8aab:d91e])
        by smtp.gmail.com with ESMTPSA id n16-20020a170902e55000b0016d5626af4fsm5610020plf.21.2022.08.06.13.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 13:46:18 -0700 (PDT)
Date: Sat, 6 Aug 2022 13:46:16 -0700
From: Jack Rosenthal <jrosenth@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v7] firmware: google: Implement cbmem in sysfs driver
Message-ID: <Yu7TGDYTyzFLoVe4@chromium.org>
References: <YuuBrUmiRYoaSmPw@google.com>
 <20220804142856.306032-1-jrosenth@chromium.org>
 <CAE-0n51UcauP1ojoskV9_2+CFPoJrs08jGHVPCZdSA_oXX1zUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51UcauP1ojoskV9_2+CFPoJrs08jGHVPCZdSA_oXX1zUw@mail.gmail.com>

On 2022-08-04 at 15:59 -0500, Stephen Boyd wrote:
> I suspect this won't work because the driver can be unbound, and thus
> the mapping can be destroyed by devm, but then the kobject and sysfs
> file like 'mem' can be held by userspace after the driver is unbound.
> Userspace access after that time will try to read/write unmapped memory.

When the driver is unbound, read()/write() will return -ENODEV, and
mmap() isn't supported.

> Why not make this in the bus driver (coreboot-table.c)? In fact, most
> things could probably be created there instead of in a 'driver' that
> really isn't doing much 'driving' at all.

In v8, I moved the coreboot_kobj to coreboot-table.c.  I imagine in the
future we could move some of the other things (e.g., "vpd") under this
object for consistency.  So now the structure is:

   /sys/firmware/coreboot/cbmem/<id>/...
