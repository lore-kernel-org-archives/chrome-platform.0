Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876701DF980
	for <chrome-platform@lists.linux.dev>; Mon, 10 Nov 2025 06:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762756345; cv=none; b=gYwscFX7MUD/2/c1FUUIEFv65AWxIpM3HazZDhsPFG/xXZORO2ehcQu8wTzOtPBdhDXD7swPlD0aGG9OvQn+SQL9kgq/jsce9Lekxh7eYBm8OYjP4NiM9C0fzR7PqAsMzQ8NlbZh4aAlXYcRfpKhcw872ReJzcHkddn8ANmlJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762756345; c=relaxed/simple;
	bh=XfRn9s635PPdurM1pAjdsO37KJ0Js+h7yomtRk25gY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcNW9SAINWlyNsSIpw/UGrwytAfcHXt+TAGXjcrIjTEjL9TX8E0ELimwr5DvgBI7GU1x8UamzOgI/aDUW7n5sl1FnRtTXfd8HetAU6Tug3Yj1bad+PGQR3hF1CpCyrM9d59nHNtun8ms6cux4bzcMC4GxSJmF5MoN49bHiyqrXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egPxRMlj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egPxRMlj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63637C19424;
	Mon, 10 Nov 2025 06:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762756345;
	bh=XfRn9s635PPdurM1pAjdsO37KJ0Js+h7yomtRk25gY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egPxRMljpNmvAhROnRfbrTRKELsGNGMg8NTpqgQp2IifjWjq7XaIc5gkvlA7QrtQn
	 l/1lIfND0lDq6SDW/d4Ff9MjDjhqtY2++pJvx5a0jOGMDX8HD6JCVpNrTCBF/ZjGw+
	 4LVKRaJ0cPxt49zBANdvSglMoejosYXpP2LMe7UZvAlM2tauskq7xfxVUX0SXJR6Uh
	 0iUFOX3DrEgRZmwVGobiswdOKEpdSsp9UN8NsIvmexsdgYEALxhLqalVKqlVU3Clr7
	 Zd5LfVmbH3wkO8HIVJMCCMNM3g4UV+Yj+trXwDvEto3Ws+FCCc4lZiOV4Ep53QGLXB
	 f/ELyUrCD6cgw==
Date: Mon, 10 Nov 2025 06:32:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_ec_ishtp: Fix UAF after unbinding
 driver
Message-ID: <aRGG9vUkldw_s2G2@google.com>
References: <20251031033900.3577394-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031033900.3577394-1-tzungbi@kernel.org>

On Fri, Oct 31, 2025 at 03:39:00AM +0000, Tzung-Bi Shih wrote:
> After unbinding the driver, another kthread `cros_ec_console_log_work`
> is still accessing the device, resulting an UAF and crash.
> 
> The driver doesn't unregister the EC device in .remove() which should
> shutdown sub-devices synchronously.  Fix it.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_ishtp: Fix UAF after unbinding driver
      commit: 944edca81e7aea15f83cf9a13a6ab67f711e8abd

Thanks!
