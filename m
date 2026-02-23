Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D42AD2C
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 03:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771818463; cv=none; b=Xl/+8wah18ipTHL9fcqW869ZsrLqFXsYb64kGkJmpfG8fexTkt1nvITIcfv6SthGXJPLDmo2+s7jNt+etGr3dZuwxzqjMMSwCnoCf8IQSh8pG7m929igFDitqPRE4FFt/B6G5PERt4/Y9xiNldFNDvCPggRl3j3KTyl817zG5LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771818463; c=relaxed/simple;
	bh=qyezi+5oRt5fdZzUTR89voTedv8Cri4rLMYuSwn4zhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkMRzC1tkL4GDZdD+Jpeo57JaoMjBxHrCiTW94BqxUUw/4bIYL2H1eu07nzGuBJM+5+u9eSV0Jmkvqh/+ystZoo1TeY7cHTR0mJCJuZPYHcj5cQ1rYHgt2fqeX4twUDS/BdD0tarQweJZInB5sKwg6AsHGYeYjEVHADa3pcdH4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBCVPI8D; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBCVPI8D"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba68df3687so5973507eec.1
        for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 19:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771818462; x=1772423262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=be26L28JegJQaN5VnjZu90EYCa/zt+aS/UGDpDvVaps=;
        b=GBCVPI8DNSQioK8q4z/qzox8uJhh6tTHNHplyoRhzs6PoWJDjSLGXGHn4ykUElvPdh
         9GVgcASY3A0Lz0tCTjR0ExEQsH/RLAs1se21Pj0ki12jIicAzSe/sver9MVg2qEDsMlg
         ZwIjfu3iAqXzgT4tI59zMZcU6VWgGwNNSFKZE3s4RwUcFtpcGiOYfG9cP1vHaHQjtbvc
         BK53GVUMT1iSLaCVxbEf61p/PeLgAujnzqZVP9zO+8+Bgyghd/M0os2oO/sSZvwbZ8w/
         PqXPbFuCcVIt5A6g94bnSpp/JEuNOnMayqr+ExtvHaHujUsrBcJjQJvwnsFW2PLxfSK5
         f8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771818462; x=1772423262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=be26L28JegJQaN5VnjZu90EYCa/zt+aS/UGDpDvVaps=;
        b=loynR7tjFuauQylJJ+hQ9TB2iAAF0LfY+yaH+M2yEbJFvmEzVrdtrSMRDAHv/LvlAG
         BSOzJ5vfXUm4kZZBIS44JMHPD2Awwvey2XC7a2mCnjKoYB9T+GeulivxE7WBJsgzgHy7
         LD0+vyw+j6DQY2G0mIToKwC2wb4TM5LHgAsLfrNoIcxhAlAaz3ikZ0hMNgrP86DnUNhl
         Bv/Bxx+tadL6t10o7RNAXgn/xefwPml4649hTdlSZ5cp3aSIoEVQ2O4WW/c6KV5tcSLO
         ClUHl5LYaUP2E5Up813zsrXd9Pzpx/j7cl269b2Q8ygoMicud+90gT7QV4FsEfR8WaUH
         LcXw==
X-Forwarded-Encrypted: i=1; AJvYcCU6XtHw2x5gpihOyIxDCSPNCS+hI2x6O7fyFQBNW2ERRaLbbJt2ZotWVY6HJuU4elhFe/fP9DI6MXBgKTm+RfM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBICxqx8CLxKIP6BMGUJB5+MGdcWVicmycq8E6AFahAmnMUaU+
	RlfknoPqkLntOOF4Siw1sOySH7wshwmnVExNMeP03f551Jw++dsArPnO
X-Gm-Gg: ATEYQzz9eZpVACJONWK5vhHxiD4LibwTiSLVgaPpiIel7pjpRH1eP1L5HhNXheZ5yh9
	mDQIOy5Na8xZmGEZP3rWgvoLaEQ9Oym1u2aTXvW79/p8qKE2xV/VfYs9arKVOWOSP3v3vf/3n2B
	dGb9PuJCabxWd6p9Vp80u/hDi3JSzKRCn52rZWb/d3krk9XvuvH9pyWeIIXd1rCfzdqk7KuxFAv
	sV5B9uAO1fuBfOEW3u/vYjp7tMcHD+9s+sZSHwRm3YkbWTq1v/6zLNcdLFejQY/52/4UM3es2Yn
	qMuDgMTFfHi+CpQdeAzW2W7cSFj3I2Ha/l1/eUhTILAoZM6LsGGr0tZA4R637bQ8292Ki+LOjVj
	/BXhNjao4FANq8GsWa17/ZTh1bK5KJVjTCdRTrFKCa93by8Usgx93IcYjSPjkj/FxT/F3RhuAuD
	uJ8AsNUWUTL5A+ufKDESuzU7uatrKi0G9r4zEdRWA3Z5VNM2n1VBmVGfv2jfrfZi2LRMvZ8QoTX
	A==
X-Received: by 2002:a05:7300:324c:b0:2b8:64ad:ad4e with SMTP id 5a478bee46e88-2bd7bd5a2d3mr3270113eec.24.1771818461734;
        Sun, 22 Feb 2026 19:47:41 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c6c:6cca:170e:c77b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe78b9sm4075021eec.18.2026.02.22.19.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 19:47:41 -0800 (PST)
Date: Sun, 22 Feb 2026 19:47:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] Input: cros_ec_keyb - add function key support
Message-ID: <aZvNY-bIIJv2mv1p@google.com>
References: <20260222003717.471977-1-dmitry.torokhov@gmail.com>
 <20260222003717.471977-2-dmitry.torokhov@gmail.com>
 <aZrencp4ZQnFC9OD@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZrencp4ZQnFC9OD@tzungbi-laptop>

On Sun, Feb 22, 2026 at 06:46:53PM +0800, Tzung-Bi Shih wrote:
> On Sat, Feb 21, 2026 at 04:37:10PM -0800, Dmitry Torokhov wrote:
> > From: Fabio Baltieri <fabiobaltieri@chromium.org>
> > 
> > Add support for handling an Fn button and sending separate keycodes for
> > a subset of keys in the matrix defined in the upper half of the keymap.
> > 
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> > Link: https://patch.msgid.link/20260211173421.1206478-3-fabiobaltieri@chromium.org
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> The patch looks good to me, just a few minor nits below.  I don't insist on
> these being fixed for this patch to be merged,
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks Tzung-Bi.

> 
> > +static void cros_ec_keyb_process_key_fn_map(struct cros_ec_keyb *ckdev,
> > +					    int row, int col, bool state)
> > +{
> > +	struct input_dev *idev = ckdev->idev;
> > +	const unsigned short *keycodes = idev->keycode;
> > +	unsigned int pos, fn_pos;
> > +	unsigned int code, fn_code;
> 
> Nit: does declaring `code` and `fn_code` as unsigned short make more sense?
> Or they can be declared in the same line.

I do not think making temporary variables unsigned short changes
anything, so I will leave it as is.

> 
> > +
> > +	pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> > +	code = keycodes[pos];
> > +
> > +	if (code == KEY_FN) {
> > +		ckdev->fn_active = state;
> > +		if (state) {
> > +			ckdev->fn_combo_active = false;
> > +		} else if (!ckdev->fn_combo_active) {
> > +			/*
> > +			 * Send both Fn press and release events if nothing
> > +			 * else has been pressed together with Fn.
> > +			 */
> > +			cros_ec_emit_fn_key(idev, pos);
> > +		}
> > +		return;
> > +	}
> > +
> > +	fn_pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
> > +	fn_code = keycodes[fn_pos];
> > +
> > +	if (state) {
> > +		if (ckdev->fn_active) {
> > +			ckdev->fn_combo_active = true;
> > +			if (!fn_code)
> > +				return; /* Discard if no Fn mapping exists */
> > +
> > +			code = fn_code;
> > +			pos = fn_pos;
> 
> Nit: assigning `pos` before `code` makes it neater.
> 
> > +		}
> > +	} else {
> > +		/*
> > +		 * If the Fn-remapped code is currently pressed, release it.
> > +		 * Otherwise, release the standard code (if it was pressed).
> > +		 */
> > +		if (fn_code && test_bit(fn_code, idev->key)) {
> > +			code = fn_code;
> > +			pos = fn_pos;
> 
> Nit: same here.

Yep, I'll update before applying.

Thanks.

-- 
Dmitry
