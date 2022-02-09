Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5112F26
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 14:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD73C340ED;
	Wed,  9 Feb 2022 14:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644418744;
	bh=DU6/v+izv8pNNZTJCmiuZGDYo/sZMpJPw+31870/nB0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bl+7PVYDhIHLxRa03h3xGNvvNewR9YeDWEpdTTP3xPq3MoEDMqZqikKqdVceX3FzX
	 A2nSLJu7I1kp/iZ8GRbcROtvxWyamXNColnpvQSaMQBwnUNYlJ/Rdy+84hxA7aaM/I
	 PrumA/bGR/Hq+2CXHu9ALHXgrHFmYVikTgTedYZ2OGvUUXDFP5W4Q5hBtT713gsjaj
	 OqcMvLwbVzzHOSR83sNgG8qi2O/vACjF5w/z7RC8Pw3vTvP0S4j3Ep4ChwrtDavvoE
	 R2g6rclN4FleYSOrxg52YiRz6ofqBSuqrpGclG/k3mP9vRDpvtBloOcFwO0l+RKdnt
	 BsH3UF/gqAoEQ==
From: Mark Brown <broonie@kernel.org>
To: bleung@chromium.org, cychiang@chromium.org, Tzung-Bi Shih <tzungbi@google.com>
Cc: chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org
In-Reply-To: <20220208031242.227563-1-tzungbi@google.com>
References: <20220208031242.227563-1-tzungbi@google.com>
Subject: Re: [PATCH] MAINTAINERS: update cros_ec_codec maintainers
Message-Id: <164441874351.2366723.7610524171266812751.b4-ty@kernel.org>
Date: Wed, 09 Feb 2022 14:59:03 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 8 Feb 2022 11:12:42 +0800, Tzung-Bi Shih wrote:
> Updates cros_ec_codec maintainers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] MAINTAINERS: update cros_ec_codec maintainers
      commit: e4e3a93c6e267572ca2345d8d86053e166843a8c

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
