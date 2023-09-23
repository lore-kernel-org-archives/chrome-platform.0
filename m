Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50607468B
	for <chrome-platform@lists.linux.dev>; Sat, 23 Sep 2023 08:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0734FC433C8;
	Sat, 23 Sep 2023 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695458519;
	bh=ISftvXrEzN9kFV3MZuQSyW3CnIlI7gp02vALClxzLHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9zEI/PTkZmnsok8J48upmCPUZ4vZezRU4MV0A+CLa6ImKJY9yKoWr80GtFedbQB0
	 ztcUVB5J65ckeGxYraSJzjonxSDaVwTBplsLTQUBC+WtF3ti77EGdKh1XLK3CsDAYb
	 2Arvlm9JZlDvVDuoSQsPm9bGzjZYDGv0sxDdp2Jlg8/DJ1xR6zXO0ouidT5p0yqPkN
	 tKkZjZvegw/A6GFU8siXthW2up4TrpO8PwjsenDJk/h7nLNDnqh8nJ6dGfg6Qtl+rX
	 uzRTLxP5N2fxIALQQrLzv0skwTeLP61WK6TMxi6Qzmdp4YIjkvhqSUwMLTPSb20c2C
	 kGx5MoyzCt5mA==
Date: Sat, 23 Sep 2023 08:41:56 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, gwendal@chromium.org,
	groweck@chromium.org
Subject: Re: [PATCH] drivers/cros_ec: Reduce log polling period to 2s
Message-ID: <ZQ6k1K//086Ptqg0@google.com>
References: <20230921141935.3973069-1-robbarnes@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921141935.3973069-1-robbarnes@google.com>

On Thu, Sep 21, 2023 at 02:19:35PM +0000, Rob Barnes wrote:
> 2. Yields more recent logs prior to a crash, facilitating easier debugging.

The approach depends on multiple parties before a system reboot: EC reports
on panic, AP sends EC commands for reading the logs, userland programs
(e.g. timberslide) write the logs to filesystem, and filesystem
synchronization.  If anyone in the path didn't work in time, the logs
disappear.

An random idea: could we save the EC console logs to pstore when AP gets
notification on EC panic?

> ---
>  drivers/platform/chrome/cros_ec_debugfs.c | 2 +-

If you have chance to send next version, please refer `git log` on the file
to see a good candidate of title prefixes.
