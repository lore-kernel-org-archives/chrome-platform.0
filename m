Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63B0330B34
	for <chrome-platform@lists.linux.dev>; Mon, 29 Dec 2025 16:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767025740; cv=none; b=RPV4f945xDHjLR9HlBtRgP9n6yj3hvGasX6VT6OLtruslXRqvbm5j2xrCg7EG6GmTlX6E1YDaNF2PkTxKmh6ltVJ6+cOJtnPGIzh7RK253JY7mhRfIQKV4gcmhUyEye9TQaP5PCo9uzS0pB5/c32PXEOGaBXd7ehMyUWvhQc/74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767025740; c=relaxed/simple;
	bh=b6RQ1NU9EN8+aXaewi+ayTN9noNZWpegcHiTxkGkE0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNUQPXklz22i4J0ctsPvg/dw8FF2YaNh6HYmoRHrw94VrgQnCSxJkpKgZLV6mNl0y7EBn3pxV+BWK0n9MLYfBAjb0E9QOwJhqHw4NF3eYUeZj3ykq0Ry50yvLWTHWmf6P2brMKWqaKBkkXpDY4oqLE4s90PwcVW79YAG/hw8WXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gRdSbGsN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gRdSbGsN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so44062165e9.3
        for <chrome-platform@lists.linux.dev>; Mon, 29 Dec 2025 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767025736; x=1767630536; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/igAIS0exjkZCSnq4MvZu4y+vS5w9AmRp2TM3hljglc=;
        b=gRdSbGsN75m1oYS0gfjHzjLpHFTuqLBylv5lvf5rD1q80QEV5MtVIixCRDZGXJDqEK
         AwAMLH8lRaUSD+oukp0ta0yiKmGDDO2Mx1nJj2cSa6Qy7AcXvps1+Eqb/md85Gr6SLOF
         NnXbWW2/iPZ4uSOSo2YEcaGm7XNS8dfCJHLIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767025736; x=1767630536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/igAIS0exjkZCSnq4MvZu4y+vS5w9AmRp2TM3hljglc=;
        b=qIMv/XTAuteo5fvv4RJ1k6nQZJz16hfIKg8/wjqfvTKyns2B8iZMcrMP2pdRw4iG5y
         kZRoNVozL+WLbuZWiEFstpn2UXj6C0bXARfH7NSZY83gowN5tiD5Hk+1NbxFA1+gdG/j
         4wg086im54lytgWN1rraNiqw5HREwLwjM9+REzACw6UaHJ4EHwB1qmsOY9KeSDgN0HIc
         Cf6tY/JEwHC/h6GGxnJkLI4baCX1rai2XyLTrfjNI0u9j7U9uqiLUfFYca/gjr8tcmdL
         cmDqAe74QQ6ag0d4IHfCsPu4Ij9Lt/LEec0FQiLuvQ4V2LaNataP7Vwl0vcvVP/Ug+ZE
         8krw==
X-Forwarded-Encrypted: i=1; AJvYcCV1nMDf5hkcqL2uiRti4njghQ3bQSt7jY7p1zafpzlpNdl9yzZ51BRTx0oOJQHMCERFRaKvmRqqgIbDGRVzYBA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyflgXj0aT/jBvcfJJ4qPFd4G4NNZrZHJFZ3wZ5vbmKg8fqJAUU
	CXVl5NZWVVInP4ygyOOTegyvxOeOOW6++R+GwJH0ZL5BIdHle36a/qqe4ZOgL4NvsA==
X-Gm-Gg: AY/fxX4+heCxvbn4ofLgFhc1xBBzjGcAkYzQwe7r2NvWRm90FJxlpcMs6ZlVcU2Gfxo
	HFK5X2uWiZf2w9R4ZMD0Ufc7ii5Y/5uDQGi12tjtsj77UHFFocqDvoMk24tgKV7nD25jZAE7iVi
	8JCRMiSLPQgG2aXuMGSrytahAwa0ACRS5pTSDoTbCy+Lu0b7rI4x+hZ+uWpI3oRUWc29vvnHPDP
	eNC2qYpzl2bsvUWISRyHVgsotzNot/rGLLF6JsjIfB9PxSzFZMAr5keon04bOVVfq0tWYbAtNKh
	deKy9oNfm2LbDgm78/nGYcH5Sg65BI2pefJMcUdG3uvFm9B8FpjBsAAgpMMFA/zUAbfU2VZToWU
	+yhsEzR/mUl2QHcFptMe46L2ZwoCRtYQTYhdiLffBE6+sNZwkfoMu1nxaPCc73km8uFSxCvcTE9
	wyWLM53ACeeNK6/ox+hCEnE4TkQENs
X-Google-Smtp-Source: AGHT+IE5z77kWrdvT7wPaMpp9A6RiyApVG0i4Gj+RnPn+57arRtLwhAvau2xJ42Pp4CWwsHrv5arXw==
X-Received: by 2002:a05:600c:b99:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-47d195a6369mr342294615e9.36.1767025736112;
        Mon, 29 Dec 2025 08:28:56 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a6c6ebsm248468505e9.4.2025.12.29.08.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 08:28:55 -0800 (PST)
Date: Mon, 29 Dec 2025 16:28:53 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Simon Glass <sjg@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: cros_ec_keyb - add function key support
Message-ID: <aVKsRbHP9WqCfWAN@google.com>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-2-fabiobaltieri@chromium.org>
 <CAFLszThHmN-eGMwwgUhSFbWcbuOYYs-eFh6d6ZVTXekRGv6Hdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLszThHmN-eGMwwgUhSFbWcbuOYYs-eFh6d6ZVTXekRGv6Hdg@mail.gmail.com>

On Sat, Dec 27, 2025 at 07:24:33AM -0700, Simon Glass wrote:
> Hi Fabio,
> 
> On Wed, 24 Dec 2025 at 08:22, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
> >
> > Add support for handling an Fn button and sending separate keycodes for
> > a subset of keys in the matrix defined in the upper half of the keymap.
> >
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  drivers/input/keyboard/cros_ec_keyb.c | 120 ++++++++++++++++++++++----
> >  1 file changed, 104 insertions(+), 16 deletions(-)
> >
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> I suggest a function comment for the two new functions you add.

Sure, will do.

> > +               if (code == KEY_FN)
> > +                       return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
> > +
> > +               if (!state) {
> > +                       if (ckdev->fn_key_status[col] & BIT(row)) {
> > +                               pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
> > +                               code = keycodes[pos];
> 
> You might want a helper to do this as it is repeated below

Sounds good, adding one for v3

Thanks for the review,
Fabio
