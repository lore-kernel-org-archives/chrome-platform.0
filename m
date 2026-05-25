Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6043286AC;
	Mon, 25 May 2026 03:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779680968; cv=none; b=MAhvohL3xGqUV4DVnbikvD/VXdm/F1fNzpXmPMTnPijAJKhTTIR2eSAikIzAaoIun/b8K2t+cTEJbhq54B53JnUo9/ICGguuwRutjAX5aPCsxj3KQZwFjfEsbmOkEsmgqosad0yFp1ZOxyk3BTWVtjxW13h++vHOdEa0vydTORU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779680968; c=relaxed/simple;
	bh=i0SnrtvajEwJuye5s0IGMZ8eSN8TN5KA6CG/BViPlrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/xi3DQQ0ZsPi+lEmFdRa6jpcGgQhhRmIm8Ggi9RIADYNs9fGjHZ2WwtjqiWRo2tEz27uz3Y8Cf3/qlZnZZQn2lhXjzkmcfGiqg7FiYz371s/DtfF65QOAx3FSDH5s2+cXKskVojy/YIhd4bogFuvNiFQMeKx+qaJmYPH5uQfPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTrs8tiZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTrs8tiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695131F000E9;
	Mon, 25 May 2026 03:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779680966;
	bh=VmfHiSSX9pSEAT1r9wN+mvvb23xhJIwxelTkM1RYGRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kTrs8tiZPnAkKO8hIlmxeY1ykhm1GRKoOQt+EBD8rhlt4kQ47Q3dlw1JMgk2j3U2u
	 rY4F3G4ADVFXoWcQzIcLx2FREjKzO6HQoLKgEUv4yWEU+foXOksmqAi+WW+Jfe06XR
	 bg72jt2EEvo2MxhIsVypZ5SzwcgR8YR0L3i0+Q3LWoJU7rX4p9rCqW8PTdBEBo95UA
	 fu3bEbjkU7Z14evjtOmGNS7PxiqimuZ3JkrvurOPhVuNtfQ4XslFC0+FrMeCdiTfk1
	 n6gntDMfXZZNXC4jkF/Y9s0JlaQxTAE4eavYj+zQz3tcwdAb/OIQkPCvp/TGaSn9wY
	 bcEhP+Sa0hy0w==
Date: Mon, 25 May 2026 03:49:23 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: cros_ec: Read EC features during probe to catch
 transfer error
Message-ID: <ahPGwygHpf_gMRYl@google.com>
References: <20260522154456.1448170-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522154456.1448170-1-akuchynski@chromium.org>

On Fri, May 22, 2026 at 03:44:56PM +0000, Andrei Kuchynski wrote:
> cros_ec_check_features() does not return an error if the underlying
> EC_CMD_GET_FEATURES command fails. Consequently, when the Fingerprint
> device fails to respond, the probe function ignores the failure and falls
> back to installing it as 'cros_ec' device instead of 'cros_fp'.
> This leads to a sysfs duplicate filename collision later when the real
> 'cros_ec' device attempts to register:
> 
>   cros-ec-spi spi5.0: EC failed to respond in time
>   cros-ec-dev.19.auto: cannot get EC features: -110
>   sysfs : cannot create duplicate filename '/class/chromeos/cros_ec'
>         : sysfs_do_create_link_sd+0x94/0xdc
>         : ec_device_probe+0x150/0x4f0
> 
> Fix this by extracting the feature reading logic into a new helper function
> cros_ec_read_features() and calling it during ec_device_probe().
> If the transfer fails, abort the broken device initialization.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
