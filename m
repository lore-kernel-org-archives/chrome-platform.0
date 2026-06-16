Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EBD37AA94
	for <chrome-platform@lists.linux.dev>; Tue, 16 Jun 2026 01:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781573990; cv=none; b=JWdSByZWZ4M0y9Mw7a3s9XAN0cqvDxfuFE7ZDNppzQpmaG9U8TB9L5jmpLKRKO+navJO+gaRwzP/w0L+2os3pfh52V5AZW1Mic/PaetS9ToA8MKzK1bPyzCBXTVEhulbrwgpVhAR09lAJ4rZleQXlUehKE89opWT96xTdO5yuXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781573990; c=relaxed/simple;
	bh=yzEFAagkbPKBWqTFJokrHcJDKIVrtUgkmZfVFXv5G2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yr2hne/lDyHo5KbvpEKApbRY0oZlnAg1irrVtBpyp/xuXB9elO1NGMp/hTE+NsP68tdeP7iF6pQS2c1uRlafg/Rn3cmqWvY1WaI+Nb3J1tEOjATjbFNDOI7+tz+Nv4EjsAxFxx/SBc1erMRVwpQ2hvDWoRhXBVlyHjxLkx2omZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DD6yLE4t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DD6yLE4t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E4C1F000E9;
	Tue, 16 Jun 2026 01:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781573989;
	bh=We26mUxPAGTf22jC3G9uEXqYp17pTIiN79gxfnsk0J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DD6yLE4tkE7Tlzo1qhN055TolXBAJPM//knbM62xBaDBODvq6Z31op1VzifscFGOT
	 UEKDLYd2Ts/TpsBXlymOhLPYf+8W3CHga55x4flxfsL6/9l4HLxPCI79h86TqquYXB
	 aF/CwmnV1uqSpgDQCbYV/JxYW6e6OWNnJ0SkKqKAgXJqffhvO0OvcmrrnnuL52u7MF
	 Bfy6uYrkd8vzR6ZxvdBcO8sCnaoWtzesNRZtchC+YIEe4Lr5chRQ/0Ppa0X8GGObfN
	 DUiFfyJIQbZh9ThkEaovBf814Q6th4bvnL7Tp066OcBfV6qnqGLHKrnVgrFrjmmafT
	 EDGaMivImwdrw==
Date: Tue, 16 Jun 2026 01:39:46 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sung-Chi Li <lschyi@chromium.org>, chrome-platform@lists.linux.dev,
	Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] platform/chrome: cros_ec: remove reference to
 nonexistent CONFIG_SLEEP_TIMEOUT_MS
Message-ID: <ajCpYqXs8-yi6Mw-@google.com>
References: <20260616001411.66231-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616001411.66231-1-enelsonmoore@gmail.com>

On Mon, Jun 15, 2026 at 05:14:07PM -0700, Ethan Nelson-Moore wrote:
> A comment in <linux/platform_data/cros_ec_commands.h> refers to
> CONFIG_SLEEP_TIMEOUT_MS, which has never existed in the kernel. Simply
> remove this reference, as the default timeout is defined immediately
> below the comment.
> 
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.

Thanks for the patch.

NACK.  This file is intended to stay in sync with the EC firmware header[1].
While the CONFIG_SLEEP_TIMEOUT_MS is indeed unfortunate for a non-Kconfig
macro in the kernel, we have historically kept it for consistency with the
firmware code[2]."

[1] https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/main/include/ec_commands.h#5248
[2] https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/main/include/config.h#7178
