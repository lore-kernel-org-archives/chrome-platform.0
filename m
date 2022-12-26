Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2865D63B
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 06:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC41C433EF;
	Mon, 26 Dec 2022 06:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672035112;
	bh=nJwsWsck/v0V67xm0z+BBo3gDBH5n5IyPZk0j3R09gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMqBeAU3SVLc9TFchJX6bcZ9EaUISCzlCt2WSSFAoyIaRHNznCgFgPqP8NvWrs4hh
	 kd+Eor2fNfxG/DO987rtNhjO542xEgrq+Zo660Ho8VP0hlAc6a47ZiFkEQ98e6+q3D
	 kqmuIXP9vdRtn9UTgT++o+AzaCyrI9c8smdiLUvnKOiGdAm9Kwt1hHPCyqVZx5O+FH
	 GtOWY05IVCDfiy7Ll5j/0h3wh9lHmuBrn0HBgW0GmTUT3Jl3MlShr8yR+S4YeysbHY
	 S4ccXTMPmbtiZeGkpjiALgPt7t1RoNvwRvZouEBrwKvpn9mUv2pnqPpt4TVTwKJ+Kw
	 7pPl1Fi7gXcYw==
Date: Mon, 26 Dec 2022 14:11:50 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: use sysfs_emit_at() instead of
 scnprintf()
Message-ID: <Y6k7Jtk1sTXIsRoX@google.com>
References: <20221205061042.1774769-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205061042.1774769-1-tzungbi@kernel.org>

On Mon, Dec 05, 2022 at 02:10:42PM +0800, Tzung-Bi Shih wrote:
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Inspired by https://patchwork.kernel.org/project/chrome-platform/patch/202212021656040995199@zte.com.cn/

Could somebody on the list help to review the patch?
