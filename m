Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDDE3321C2
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jun 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857588; cv=pass; b=PNsJ5NWLUOT8FtdHmk3439AV/W+oCKjXGCYmqEW79V2e7+G8GRJe1an6w75rpVPrWvnGA5kAxsr1oLSJ2gswFIW9kNWtMtsN4wxBziAq5qdpAyRUByjnY6W/hlOlQxoRf0Hb7C6wwJ4M4Mf23aDgLiAPNcMSp3ezE+lOMXZbUwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857588; c=relaxed/simple;
	bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t80KNRWC0jGK8v3tAdJREokoiSot841V6YJ4NZU8oGZT6gOQ/ZKqxFQ5VZ/xuJXxJsSX4cAxnfumLmR7UaL7z2yBhOAw/Pell8Jh92baqEBHIuy4u0oFf+qUFYoYwbGbczF7tdWAyh+T2kxaMRPKvK2Tj5Ubu5yIEcjfNSCdBlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWHbdNA+; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWHbdNA+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37c8e7c8137so979173a91.1
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jun 2026 01:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857586; cv=none;
        d=google.com; s=arc-20240605;
        b=JvklLC9VGkwt48zzz/yTSbVwTg1EKimKpWL0Lf9S7WE6Sj5SfCyFcw1+6dOWXdw2x3
         RVkv1XEhShf1Gt1EtfOGT7v6aihnFqQHxdonwAPLjtSPhN7UkuqUrGKCcwC26XkLdgWb
         5m3NP5XWDviyj8/BP+lYOIxnjZZYR8aGvgn6DG9EdswKeuVSeHUF7srqur4uThpoBm42
         Ef/TYU9tHNpA6gkumlg1kqOTivEpAh1VUSPTDvv3L14ELLq6ultXxzbJLZkWRrqIM9/I
         K90AQyHheFTicQTf6NrQAOIgwPz78qisp2E6BqzMUAwi16wulDbE0DXeWKnWZ5WTQCK2
         rVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        fh=GdkgGBXEAjI1GSeYDabVUK9pXVR/csC8+ADepyP+HzU=;
        b=i3zaRWoSuqjyjrbJNU7GMvrbz9JxrHI49+xs6qAMa8CsN7+pOuN9ihfHR+WgV24Uew
         9CxcN3w8m3JEzaDGFnVDxhUBQB66cYdLGVPhGBafFbP4VexqDDszkJLuzGNpUppkBKbJ
         ni3r4t5SZFx8ss7FVXIvrAZ/RdxYng7++sLzVPFzD1AfEEr1Dw7e3ErMrjGdHR2BRkbi
         znpR0QcjzvuNNFqo6j8nZke06E21AFpQEgXaWDGgY+X4YndbgRnb8SQvkRlGMFntfM4c
         6yZGe6yp2vQDUP6/xVDsMniWhKKiPqxwyhuWm9j8JaQMW+oK7eOdAUOQqXrouCFerlid
         qeVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857586; x=1782462386; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=mWHbdNA+bnPAqTyUInTrbiF3MPjls5CMktbE/xjaVcYA7dIeXp/r/OF3JqfkpNK23a
         JqSEasf8jOVMimTO9KytbvMdBRvpqxesMTyAfBe3apubeWV0KoxMVSJaKK4QWp6gX+Nd
         OXxuLUuuRan3Q0Ce8DONNRlIKX4ZMhvtuz0p0TtRmOk6jVC03J9zeuQBcwfc20pzumJt
         XlozdSIet/15VMaWlc57FEkacYlRxIVttqzCvoEYg/I5c4KD7SwXYzAi7/0VzqY5u9Jy
         eiwrZDc2fe3LikhwYPjkubL5KFIWHiMztfJvuF+7CvasHODtCMRW4smMjnZAgurODStV
         sZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857586; x=1782462386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=Kft6N5KBxZJKGjpgtUh6jaShKMEYM6upSQogeYKMlfkUBvVFz+0/cSuqu0Lmis5y3T
         EPjwPITWhJMo7hHpAbw1AdyH4XCzTJaToe53R67VpOFguYGoVWC60sBNIVvN0LfbTaCj
         n9uU8t8Tg5AcXl2GHbwuw+inLX3p8Imjxk3uav3HC29AK76vLEd6gaYHgG7GMC3O8si4
         0LXUr8ib0NRgtVuOtk2xmGzPTX91Y8LnQr8oUg5DqMXc610xuGO3KaeGQrAxlV1ld7Bh
         inHAZYrNapQ4ynWrfXBBfHhalXcfWDtdkeuSkagn2D2zT/Kql9w+CMaN7V6b8C7yUJ+Y
         UD6w==
X-Forwarded-Encrypted: i=1; AFNElJ9INXl5zwnepl8+Flia3XZa0Kb1ozof5hK6uAQDNmHtJgnfGPoZntV+ZUv3b9ki9ZU15usVXzNXi7O18ZgJcac=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkO5Z+MPUf7TFr8qVL4aJj1uDQ73V7ot5xDAt5Pb4Ev/gjLtzH
	oq2FOV3xL5L9h/9ylTMJA6cAetdQWjAGbCUCw/dgK3/NtjnpwU+1TNksUpIqjT5V9NgJiufY0US
	V6uPSbC4CFWx4lwinQXk8ErK7nHvIW9M=
X-Gm-Gg: AfdE7clOeedx1U3q7Ulo3KyWuw14z2fSRsU3QHrTqwntRYTgDDJQr6kjIvfZsBlycVm
	pazsmvNJyCQkDQqrW8WcHUopUv6uaUUtzdEYyuCJ7beKy5AXEIC23gA9SPGVRWnomoBAnyq9oqL
	Jt0ymeKa0h/CIEk2/CdSk3Zq09WByuSQcOBu1jkhSBPlXc9mTgga7bpbAxTs0WghzGt/I3klBI6
	4QIrhI6Lk0cxRES7EJWv40DFqyZhx2zjoHgcctqnMwKBhoQdJwFIYJpNR+9D7zPb2I9mTmOPMpD
	b6zdxavRbTFZVFBrmMFHmEwHfaU=
X-Received: by 2002:a17:90b:35c4:b0:36d:cc9b:2f67 with SMTP id
 98e67ed59e1d1-37d1e8d2625mr1979109a91.19.1781857585816; Fri, 19 Jun 2026
 01:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-12-phucduc.bui@gmail.com> <ajNud7QkwF369lBY@google.com>
In-Reply-To: <ajNud7QkwF369lBY@google.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:26:14 +0700
X-Gm-Features: AVVi8CddXW5ZNLmY1o-M3ykiX-yfQTjv2vw19gnq_6wH9bwOdl1r4oKcoEQ6Mfw
Message-ID: <CAABR9nGVAiUpnmnoszLiNDC9ooXx8e9YFmMhv5aWLfaik8tjHg@mail.gmail.com>
Subject: Re: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>


Thanks for reviewing the patch.

Best regards,
Phuc
