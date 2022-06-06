Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6951FC8
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 03:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEB0C34119;
	Mon,  6 Jun 2022 03:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654485864;
	bh=27QfA0HUowPRHp50PZrytVJKom6NrSAJVHItu8R3jHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvcFToTHkstRhWpP8zzRAtwT4O09ePpK8HGekpw3LbbkO31qHgbzt6f+XtyUX0wyA
	 Upkatwg5nauh8UM2QzesBlVcMsGR/vOtWBVpC8AQ7EE08dURfEzfG2PAQfmyn3Wsev
	 fbiAi3oV74RKwRDQyTv0Ao+mF7On+YoFOu+v3y2rwJR3RNstABANHp1SN/96ILPiON
	 E8aoRDtBzGZ9BnEuJp+MH983c3K/e7h5ieOGtIgCU0lq7G+SWBxJyWELlENqgeq8qP
	 Yiu9caGxHd3WDJsM/emwZ+t53/hVArkLUxciUrdm/uTeV5OPOQTfX2fckcYnno1Mrm
	 YoUygv94h4p3Q==
Date: Mon, 6 Jun 2022 03:24:19 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Fix refcount leak in
 cros_ec_codec_platform_probe
Message-ID: <Yp1zY39dZDzquBE7@google.com>
References: <20220603131043.38907-1-linmq006@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603131043.38907-1-linmq006@gmail.com>

On Fri, Jun 03, 2022 at 05:10:43PM +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: b6bc07d4360d ("ASoC: cros_ec_codec: support WoV")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
