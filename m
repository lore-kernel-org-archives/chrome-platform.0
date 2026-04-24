Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8879B36D9EA;
	Fri, 24 Apr 2026 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017521; cv=none; b=Efev+tlN6PB3cqpqpahBODsEb63dbeMqYzUBfDvPIYPjeMU+3QTsmcGevecOVmxretxE4BsgeB8O/mzlh3L7pyipCqYKb9ZeeAqWagEYpzCaKMJF/YLViN8Hi77z2ESFfItcM6Vc74vlQZ+dY7NA4zBeuh6uR97QefSD9RN+qJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017521; c=relaxed/simple;
	bh=80i6T5R6Zdy47aQGrZl6wztuO0VO+ef9e2QeqsFWEvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuAWJr1pG0Q/+Hb7ZnmptZ4iq2cxE34jHaoiG9a09n7f2TYaNmg2oMCmxqNStY+3eCHKVJav2Ws98yOLJelGv7NaQbqYkyl1i6iUNMdBLa1DwO1IHWMlE87E62au0vrQXJmY0SJk+hEt2XZmLfNscBf5II8oeHi6p+MxvdGdXPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmnd9Lx7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmnd9Lx7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BAEC19425;
	Fri, 24 Apr 2026 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777017521;
	bh=80i6T5R6Zdy47aQGrZl6wztuO0VO+ef9e2QeqsFWEvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmnd9Lx7T7epywQIph5t6WE2MXmojhfDMPdRV8fwruDebkJVmhxERwKogMnPe081u
	 q22ndJL5SMQ+PBO5T//E8AA9epd2uD1HJRdrWCNwL0/BeCETBSCwXqIgnfjY9HCYCe
	 YPHtYrcXwqBeP90RcSlj1qGhpYZz30CHCmFq9TYj9jtvWrLhWMDgs748JNmXdTRIlc
	 6Rjw1kjQIzLIY38V20fr1cY+0wgXj2fMVfkEVR4Gj6qX1KYfLGsJc9sUAhIP7/V36h
	 p9K2+nc3AM95prrSZStmvfmeq/7XvvDO8IgqXa0bRIWPUKb63dRY1VTBL7yEtlgYyB
	 5HTwtVKj1XIhw==
Date: Fri, 24 Apr 2026 08:58:36 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] mfd: cros_ec: Add a helper to retrieve the EC device
 from the MFD parent
Message-ID: <20260424075836.GH170138@google.com>
References: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
 <20260404-cros_kbd_led-cleanup-v1-4-0dc1100d54e3@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260404-cros_kbd_led-cleanup-v1-4-0dc1100d54e3@weissschuh.net>

On Sat, 04 Apr 2026, Thomas Weiﬂschuh wrote:

> The 'struct cros_ec_dev' needs to be retrieved from the MFD parent
> device through a non-typesafe API. This logic is duplicated over all
> CrOS EC drivers and it is not obvious what is going on.

I don't agree with this at all.

dev_get_drvdata(pdev->dev.parent) is way more transparent than what is
being offered by cros_ec_mfd_get_ec_dev(pdev).

The aforementioned call clearly states that it's fetching the parent's
driver data.  This is better.

> Add a dedicated helper function which makes clear what is happening.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  include/linux/mfd/cros_ec.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
> new file mode 100644
> index 000000000000..ea5b007accfc
> --- /dev/null
> +++ b/include/linux/mfd/cros_ec.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __LINUX_MFD_CROS_EC_H
> +#define __LINUX_MFD_CROS_EC_H
> +
> +#include <linux/compiler_attributes.h>
> +
> +struct cros_ec_dev;
> +struct platform_device;
> +
> +static __always_inline struct cros_ec_dev *cros_ec_mfd_get_ec_dev(struct platform_device *pdev)
> +{
> +	return dev_get_drvdata(pdev->dev.parent);
> +}
> +
> +#endif /* __LINUX_MFD_CROS_EC_H */
> 
> -- 
> 2.53.0
> 

-- 
Lee Jones
