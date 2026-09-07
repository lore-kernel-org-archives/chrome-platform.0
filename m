Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315422931CE;
	Mon,  7 Sep 2026 04:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755252; cv=none; b=jFs3idyjvUn8Fqbuh6hKur/drxoPBTfIibc1cSL+OwOVX1hbC0vt+XX5IURSrfTSO3E16zqAxdH+dssdYkAWbtJfsU3iZ8EDRD4xUBKvji9gTvAnjCF4ZCu8xCFzO2EWsXjSB0ShvCoXCH/vISNiY6xO32dQsAJ3Y8N348t7p8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755252; c=relaxed/simple;
	bh=HrxgKSd7KFQj9ZzDDn47uJGtQunw1xl04WO2H0Xu0As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFW4PB1vdu9JQzoCVxDye1IjmWoFCX4DZk5Cm2nrRK/a9xBswQeUGsfpqXU9PRLdf5hpgJOo5m4mnE8NDP0eDF9x5Je+40ZmdPqUYTYUZ+J+0tie7roRlYqL5sryrmxeqj+fHz0Br0O8rdROAeLRX2wDg9Ch8lgyvorj95Tns4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0se9P6b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0se9P6b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF6D1F00A3A;
	Mon,  7 Sep 2026 04:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788755251;
	bh=eOiOiDTjpTR/pJ9e5X2FWMFuX/Q9lmvlMAZXJETT8CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A0se9P6b5kRb/yCJaLc16LIjNCTiDGWM+BwznDilpXHwZYlzL3MujAgzWA+6tfrhC
	 Ix7i16k2F/JNfHIG5ADerMsAffQ6jIMuU7iZL6ebD4GTp5X1jL4DewhmeVLiz7ZrQU
	 +VtpaHMZoWYQP3NyR2RCYUF2FfNIMScg8RxJbMioYeH0Bx8KHRF3cQKU5MoVsh0e8O
	 GVrsghbOIufS+Ww0ouJ1Tw9wxKVKtp8ssTo0dNsnPwAK3Il1RWazwT4PciJKOuYgJ5
	 MGMHcn8pfGKF+4Bvr+TZLcsudGkOrZGkQEzIY32uJwI0zi6qrzAA3X2pkpH3Qbmogo
	 rXoYiAcwQMjUw==
Date: Mon, 7 Sep 2026 04:27:27 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	=?iso-8859-1?Q?Iv=E1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>,
	linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] docs: ioctl-number: Point the 0xEC row at
 cros_ec_chardev.h
Message-ID: <ap49L6r742L45j3f@google.com>
References: <20260905102754.43160-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905102754.43160-1-kmehltretter@gmail.com>

On Sat, Sep 05, 2026 at 12:27:54PM +0200, Karl Mehltretter wrote:
> The 0xEC entry points at drivers/platform/chrome/cros_ec_dev.h, which
> commit 5e0115581bbc ("cros_ec: Move cros_ec_dev module to drivers/mfd")
> moved; the ioctl numbers now live in
> include/linux/platform_data/cros_ec_chardev.h.
> 
> Point the row at that file.
> 
> Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
