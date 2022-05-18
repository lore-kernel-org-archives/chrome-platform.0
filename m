Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691B44690
	for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 03:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5C9C385AA;
	Wed, 18 May 2022 03:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652846160;
	bh=HdoByi/zUhr+JLFYPlfgIYQGec1a21OZIoDG/tTTYtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWFnKVyh8Be2jF5K2H8hThsO6wQ3G8KT5xsDUz70vKDlEGUYG/MDgECp90jx5GDu6
	 RSnnwXt4hzh8+7PVRNzMq+q/2qtS4Z+B90P2pjNscQGb1c4JKPnAcwtQyGhQcqZFjQ
	 BAkqT5/RSP2FgU5bVlNluFlnJrxWZKMbtnueJUeIFXG2Ad3UmiuSBxKMkhaTmOnVmc
	 +V1CxDTUsCYPwiYdw3Idg5ui/AZZv+jS7r/nmuX5lEsdHlABBSgKstUD5x3p65bgio
	 U67kgY2tzjrFHFxDrY6B6J9biUpfUAfquzsp7pqsjWAXnZEFY22LOuBFAC0g0krkhF
	 ehMFhkcwQtK0Q==
Date: Wed, 18 May 2022 11:55:56 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/chrome: check *dest of memcpy
Message-ID: <YoRuTN3q2WqruIaR@google.com>
References: <20220517095521.6897-1-ruc_gongyuanjun@163.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517095521.6897-1-ruc_gongyuanjun@163.com>

On Tue, May 17, 2022 at 05:55:21PM +0800, Yuanjun Gong wrote:
> From: Gong Yuanjun <ruc_gongyuanjun@163.com>
> 
> In regulator/cros-ec-regulator.c, cros_ec_cmd is sometimes called
> with *indata set to NULL.
> 
> static int cros_ec_regulator_enable(struct regulator_dev *dev){
> ...
>      cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_ENABLE, &cmd,
> 			  sizeof(cmd), NULL, 0)
> ...}
> 
> Don't do memcpy if indata is NULL.

The fix makes less sense to me.  Did you find somewhere that `indata` is NULL
but `insize` is not 0?
