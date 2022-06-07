Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6107F
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 10:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0A0C385A5;
	Tue,  7 Jun 2022 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654598740;
	bh=tMS1gG3dXMPWf84lcdBNSw3MxsgI83j5BwdlSZTqOaA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fSj1nLhWMxGdMrbyxQD622Xxcv9d4lhwS3PvmyWltkid6i7b3ugUjtTYNQ9Gc2VqJ
	 7Nh/qd88jGvpD9J70u5ab46ybKz2OpUxLau3iYDBPrwl1Dj9UWVpld1nrLTgdwBLnt
	 B/Kl3yGmPv/9zut2uRxca/zlmMg8QZf6D9YdhUOtNh73aWRctSII5RstzBKKqZ96vg
	 u/qW2ZDK3NMvLxKL/mrvq/pusJ/s3sdPEVivGeUHDMEk4Ew1XYBdarVjJ/Rlqk+GYy
	 TEqy3U6uNwiq/Y4JXILcrm06XtAp/1852GT+15LJ0aqrYowdrIsQyHPOCffmca/tNe
	 ekQ2oT+q0CgGg==
From: Mark Brown <broonie@kernel.org>
To: cychiang@chromium.org, chrome-platform@lists.linux.dev, linmq006@gmail.com, Liam Girdwood <lgirdwood@gmail.com>, tzungbi@google.com, Takashi Iwai <tiwai@suse.com>, groeck@chromium.org, enric.balletbo@collabora.com, linux-kernel@vger.kernel.org, bleung@chromium.org, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
In-Reply-To: <20220603131043.38907-1-linmq006@gmail.com>
References: <20220603131043.38907-1-linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
Message-Id: <165459873804.301808.717161588235185866.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:38 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 3 Jun 2022 17:10:43 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
      commit: 0a034d93ee929a9ea89f3fa5f1d8492435b9ee6e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
