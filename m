Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A70784039
	for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 00:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771720759; cv=none; b=gCjfmEH1VwTz2pkg0HP0jL49VIc6DybUkYxYovG1fgopB0IKI+2NYEqUABz2TfyoSaT3+lg4Gbb317d6uJykdFLCSPKJok01m6xmCmM0K4nfkVDZPBquejBAjaAM88jLrmuyBZRfcw28aowLLYTLz8yV0TAwyhBhrL2UkmhDxG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771720759; c=relaxed/simple;
	bh=/NrEAiERqs5xvAOfLmrFSIDyHlICGxMThAs8q6g1SwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZdY0crL5U7cuWN0YJ83ZezET5IyUCcF8bJBCpIsie5ZuFs5qreni0n893azGKpQJZW5559QO5FMcxnxo+a7KxogUozEXUBXj/rGLb3RuUSv6zyhTuK6NBPwZz0oBjlxiWZpyHvZhA42deK8yLuCN84PU/LOBXSj6RMVV20PWjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mi5BWBmt; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mi5BWBmt"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12721cd256bso3643918c88.1
        for <chrome-platform@lists.linux.dev>; Sat, 21 Feb 2026 16:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771720757; x=1772325557; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PKYjLrAHd5aTWbt8yMmjZEe0vbqg6p9D4PpS1+LirKA=;
        b=Mi5BWBmtK8kUCiImtDwAwTbH6hy/64GpBRH1T4wDfMIrmRke7/bSjyq1SISkjMYrri
         qsi8y4lkYgbW5D7KQyfhKsdMMaE+M7tQpGfgm+e2TpR6z3LH5sHx88Oq9dktesSVYOav
         nJBgYSXQd5QkZVtI54wH8P+dLcaJFWBjZrdKK/tadJ3PIh1fGZYc8WwgRNgy1FmV2ixG
         BM/vCUyneFo2jwIQHtMhRdf/UCgpv6v/in8UK9frXxiCVe0tE97GN+SFOGp0kmZeiB7g
         iM2A+lZIJZPDkuM9PBWCJ2cxK30g2F5CH2sls3/YztFi3dcQ5eN08J4nR80zTm8fW/FJ
         72LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771720757; x=1772325557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKYjLrAHd5aTWbt8yMmjZEe0vbqg6p9D4PpS1+LirKA=;
        b=jQgrC2gz4IThRFAJuEcdBw6K8GlfaAXm/7mMo31R+QwbmN6QWS+3ALXrAznWNiFMKe
         OLGvGmGTsbIeYeFmPdJI5k2eb0uhUjDvusYtAjgVsU8J489e5idBZm7iKbWk8fao3jQp
         Sgm8jEeSoQFArbOlmXy/pD0DUHlmzaTJBXpv08kTd+10xz743OJ6hPYDiuA9lApLOmUL
         35HoEFbXUuS+RTChD3arpPH98NgPKc1oEC6l/Lfz7CR3iX+M+K5kaBjXg70QmRlG4VuO
         ihUapApFmO/SGHvDXLHamgt1LnjpfF2IrQnaCipao+W8g3bzJQx39QGU+63qEOfDHDsE
         SmUw==
X-Forwarded-Encrypted: i=1; AJvYcCV+GQa8GIPV9fk0w1ETx9kcR3Vsz8JPsymDO6nt8HjbC6n5Cn8hgGpRlj1KrH/3WdWNE9XZ+kB/efTgu2U8u4c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1a6GPgxVACwwjAFDYnqlZgeUbZBFKE9A1/6pn878kyVCeW33D
	Qbl+IqZqIExfSdVXHTnnw1IgnBvuWcYzkdz+o6oNLflTWfixKycf1xx4
X-Gm-Gg: AZuq6aKJTLkLSUjaWkGPZVSVo3KGsOM9VOwi+vtTnAh//2KltkiaR+6WkzLCKo9Vl9Z
	Qmq95ipU8PiDuKG6JNahtCdJEreP53gdulRyVL2XZ8Se0J5S7ToX4GsLSlR1/UmqO7ZRfXmkKLo
	HLv6JXDSSZbXfmzU76aYqI7JKMb7JnNWFCucC7sx04DguM6qyyuh2ejXSvYk39RRdMsloJLY+xp
	Qv+ptu1GdYq8PrNcOHr6WscHqbO/o1UaBYIzAXYryP5NRXsnZqFVwBnHxav8nBV/qx+EKaeU5aG
	O5qpNlDvPuD9r3jRLDMnaBklVwJEANAIn/nkc+jh+WUHThjTaqJLb9vhaU/RjhjHkm7Y5i0QrJm
	n6y5HAcK4ZyHYdjgErDpPVuD+f7U0fqw5t1WQsnuXk/5nfDJJelLy+mRxhzSyvqkHROCGR6CAtd
	ove9JI0iUAPpTBj7ktBawRBYxE+eERv3mo3a9CBR0/efvEwOWkhgIZAV8x5UzofJo=
X-Received: by 2002:a05:7022:a8b:b0:119:e569:f61b with SMTP id a92af1059eb24-1276acc2b9bmr1945251c88.20.1771720757247;
        Sat, 21 Feb 2026 16:39:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:73d:b075:516c:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af8a657sm4086704c88.12.2026.02.21.16.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 16:39:16 -0800 (PST)
Date: Sat, 21 Feb 2026 16:39:14 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] Input: cros_ec_keyb - add function key support
Message-ID: <aZpPz34uC8EXK70j@google.com>
References: <20260211173421.1206478-1-fabiobaltieri@chromium.org>
 <20260211173421.1206478-3-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211173421.1206478-3-fabiobaltieri@chromium.org>

Hi Fabio,

On Wed, Feb 11, 2026 at 05:34:21PM +0000, Fabio Baltieri wrote:
>  
> +/* Returns true if there is a KEY_FN code defined in the normal keymap */
> +static bool cros_ec_keyb_has_fn_key(struct cros_ec_keyb *ckdev)
> +{
> +	struct input_dev *idev = ckdev->idev;
> +	const unsigned short *keycodes = idev->keycode;
> +
> +	for (int row = 0; row < ckdev->rows; row++) {
> +		for (int col = 0; col < ckdev->cols; col++) {
> +			int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> +
> +			if (keycodes[pos] == KEY_FN)
> +				return true;
> +		}

We can simply scan the bottom half of the map linearly, I think this is
simpler.

> +	}
> +
> +	return false;
> +}
> +
> +/*
> + * Returns true if there is a KEY_FN defined and at least one key in the fn
> + * layer keymap
> + */
> +static bool cros_ec_keyb_has_fn_map(struct cros_ec_keyb *ckdev)
> +{
> +	if (!cros_ec_keyb_has_fn_key(ckdev))
> +		return false;
> +
> +	for (int row = 0; row < ckdev->rows; row++) {
> +		for (int col = 0; col < ckdev->cols; col++) {
> +			if (cros_ec_keyb_fn_code(ckdev, row, col, NULL) != 0)
> +				return true;

Same here.

I made a bunch of changes to your patch and then a bunch of changes to
the driver in general. Please take a look.

Thanks.

-- 
Dmitry
