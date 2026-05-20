Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6C93438B6;
	Wed, 20 May 2026 04:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779250886; cv=none; b=N2Z9S8hZwTDWeCzMV5/Z2GahIHmD/ItHJ24eCWyZtZ7UMXfhixICxaUSnDecibSqYM23jAelXEEuvIxX0r1K1Pj2Qo32zoY1p6co0g3MjJtXapL9rt4wOs02kg/OCH7C9EgYvLXDiAQI/vAb+sUMs7fMRz+P/vL8XgdgEt+fASE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779250886; c=relaxed/simple;
	bh=cBK33rV/zq+U12XTkY58mdICSbQEL/Xr1eRH8kw4VPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFRjCsxOLRvtRKcimHZsVGI2hs7DCPIcw6DWD6nXg+SbOvT/IKoS7hIGquIQzQF/1V8mUYeWZeZdntHnSCSK2apwqFAk8ngllNCQkF8AxYYzoIsiqwttrS2Vu/KyKa9vyL0sgiFEQnQEp7cRnuwY5rC98E6V2RAZj/jTGTp5X7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzJA6oXb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzJA6oXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B381F000E9;
	Wed, 20 May 2026 04:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779250885;
	bh=FXQYapBbx9+BEEx4T+rTeQR0r+LKTNb5CYOCkiMzQ68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kzJA6oXbuzNJq2OAxH1Nyec+kVr8H3l/Owic78+kmmA8/32gXEN2v123HWD74Y+jy
	 wRyMXWeIjxGZMTqKedv8mWAtT08Opf7APOSKlvRdFFTYcwofwPR4woMSfz6/xMPOTu
	 ekTCVV+loBU7rty4H9Dk74fsGU1ks+WJJRuKnG0fSWeFzWuRst5U8N/8NbDunbZ8UM
	 HFvevEGjgppQFL22/+76nk9JOfEpN4tIQYVn4fmP1Jv58gzHMV0DBKGoy0ApMV0zg0
	 kNu/XXMrZfKa5FPY2DIcOK68ra+dkhxKY0cFHAF8AD491xXCStWwy9fUff+ESx8U1Y
	 yzDnAGCZCW0MQ==
Date: Wed, 20 May 2026 04:21:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Dan Callaghan <dcallagh@chromium.org>,
	Sami =?iso-8859-1?Q?Ky=F6stil=E4?= <skyostil@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] platform/chrome: Use named initializers for struct
 i2c_device_id
Message-ID: <ag02wkbd5p7W4NUr@google.com>
References: <20260519150819.1591409-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519150819.1591409-2-u.kleine-koenig@baylibre.com>

On Tue, May 19, 2026 at 05:08:18PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: Use named initializers for struct i2c_device_id
      commit: ace8ee71e8ef4d6ef5a6501469df95237e1f7406

Thanks!
