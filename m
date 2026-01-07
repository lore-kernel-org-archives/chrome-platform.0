Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF23719C54E
	for <chrome-platform@lists.linux.dev>; Wed,  7 Jan 2026 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781483; cv=none; b=ki/achX+CUIrEz0CxTNFVx7K4rt76gv4OquLIIVmiY4pE/IzvhC2jEj95CUbZE+W1pacLnXYYyqfHBeIbu0gjiNd/JXs7sMB/eGzjnsnocZysZgPb/2xxes3fZj7ZM1laKPqBoCat2GMmiIYLBQaukjb3kmW3HOyrpofXBAwssE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781483; c=relaxed/simple;
	bh=RU676P3TvU0swoFzAWorS8H0cptCGiCBmBQZLWScomk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwTxijvalopHcERP6Kqz4urQIEypzB+g6aVyF/yT13bu/Za8qTWdvscRWpfENTw+H1yjI6v+cgngbjg6NoxGyCh4ZpFNIQ8/MxsggPZZymWY9Y3t7u30PpSvQa6itAqy1ttTGaUFu4hyMcj6csM0vILqU9gKaZGfBsIRtl8/xMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nWrBrGAJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nWrBrGAJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so10760945e9.0
        for <chrome-platform@lists.linux.dev>; Wed, 07 Jan 2026 02:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767781480; x=1768386280; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AK2Gg8unTsWO3CwKx4f9Ov3gr2i0DpoldAAWtOWz2w0=;
        b=nWrBrGAJwCfEeH606dhzNZDciqXN+SSCT1CIo+9rRIszxfzCDrGl4xB07GG1Z2/9U6
         3Ydmy8EpEgfUtY0dSMdaDMRzTQQu33vCIR1IYBawe68Iomkqped9U9PZVJeO2gAJxmEA
         bvqwfL4POI6JrsquSsREQEmyEakWw0iQArL64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781480; x=1768386280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AK2Gg8unTsWO3CwKx4f9Ov3gr2i0DpoldAAWtOWz2w0=;
        b=i29kvKXrA/S7plEkKDR+cWWrTFtcMMd5wZsx1o9AdUqKgYLNp9zJO91MVDFNv73rN0
         UWD+lfY8RcXxYS9f6Ssasg/WmDBcF1yLWnYbzGMjl6bsxwMO1lW6sb7owV888j5LzKse
         /MwAxBo0t2wshbxrmNDVAAOAA30fkQcVwn5I4rMBGzu487VboA2vd+9fwZvtiCFUfAv7
         ZYPcluEJ0Fr38Kpr0EONM2205+QhWmn0t7RW7FS2jZMGI81rumZKAz9ehX5FCHOpEdoF
         4pBDGO4vhLeuF1pkyCKx7hnaEX06LF5DkcVEThS9MVKJwOVfAeG3ZEVIZ5Rzfd/dRP7H
         PBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFOBdqWsy2xAreCxV2XI80Re83TUIAGGJKh4Rn0RFXoWgkK7iFNAmSVIonGvcuN35iC/Wm3uOa8VBxJhneQdA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNabCzMLiBqx9DRt6VsKXkILNULd+mNAmBghGFjXwC+q/zNdrw
	rZ4p9T0rfLuTaADASgJiaKTgW8JwBJcOZxClkWUG0IdSdHShz02q99CEAMu7elMuwJhu94t4MN3
	xqvo=
X-Gm-Gg: AY/fxX75An8y4PKQxVujE5tsXKU/p1jaKbLy0jmEss85NK31HdniUDvyECE7tWVgZwq
	sLHezcvw76eDpTWw4/e0KxelQokSCTTI/z77Zz+OIfnv+oO/d0j7SRW6XMddDqLUwPyTlKvvGrh
	AVFAa9KH9OjgyEukIcpbZ+GJoIHacFOrVXNrGwSz197+wpsgOtRsi21rCruAnWQRv4YUEvDEou9
	YpgpwNymwkMvCNH4Oqan9MIswH/vjR9n8DdoLGwKxaXOqZHY41MSh+Atk7P+mqAbedM4ZpQxyhB
	BKgp4R69rUutQXfMKVXIpTDyD9NdYGOH2ya0FIirG4JFW3n71ZVwOf+NIS+rnG/8JAl/NgJUI4I
	PeNp5360H3jF5qUbsAxnlzxHzG/hRkI+cHMHT7XjprJp/ExOM9XlEMP63NYsxCZcvEPLzUoPcIU
	nByZ7+7owjcT1vJc+1pieeU0+H9OeW
X-Google-Smtp-Source: AGHT+IELXErZD8ru3w6x43TKd1f8wm86x+ymI62qEzqJdcBMa1KawoY4byUO5aTYAhFJUs8vu9rlqQ==
X-Received: by 2002:a05:600c:19cc:b0:47a:7fd0:9f01 with SMTP id 5b1f17b1804b1-47d84b21227mr24311245e9.16.1767781480359;
        Wed, 07 Jan 2026 02:24:40 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f653c78sm93239545e9.11.2026.01.07.02.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 02:24:39 -0800 (PST)
Date: Wed, 7 Jan 2026 10:24:37 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Simon Glass <sjg@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] Input: cros_ec_keyb - add function key support
Message-ID: <aV40ZQRNh11zAtFz@google.com>
References: <20260106112953.692304-1-fabiobaltieri@chromium.org>
 <20260106112953.692304-2-fabiobaltieri@chromium.org>
 <CAFLszTgMeRRi_=Bs6wzdZZGDn9DbmnZEdkbqPOhi0rqDs7DnPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLszTgMeRRi_=Bs6wzdZZGDn9DbmnZEdkbqPOhi0rqDs7DnPQ@mail.gmail.com>

On Tue, Jan 06, 2026 at 09:22:06AM -0700, Simon Glass wrote:
> Hi Fabio,
> 
> On Tue, 6 Jan 2026 at 04:29, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
> >
> > Add support for handling an Fn button and sending separate keycodes for
> > a subset of keys in the matrix defined in the upper half of the keymap.
> >
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  drivers/input/keyboard/cros_ec_keyb.c | 174 +++++++++++++++++++++++---
> >  1 file changed, 158 insertions(+), 16 deletions(-)
> >
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>

Thanks again!

> 
> > diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> > index 1c6b0461dc35..74ac1700b104 100644
> > --- a/drivers/input/keyboard/cros_ec_keyb.c
> > +++ b/drivers/input/keyboard/cros_ec_keyb.c
> > @@ -29,6 +29,11 @@
> >
> >  #include <linux/unaligned.h>
> >
> > +/* Maximum size of the normal key matrix, this is limited by the host command
> > + * key_matrix field defined in ec_response_get_next_data_v3
> > + */
> > +#define CROS_EC_KEYBOARD_COLS_MAX 18
> > +
> >  /**
> >   * struct cros_ec_keyb - Structure representing EC keyboard device
> >   *
> > @@ -44,6 +49,11 @@
> >   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
> >   * @notifier: interrupt event notifier for transport devices
> >   * @vdata: vivaldi function row data
> > + * @has_fn_map: whether the driver use an fn function map layer
> 
> How about: driver uses an fn function-map layer

Yeah sounds good, will send a v5 with that comment tweaked.
