Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6CB20EE
	for <chrome-platform@lists.linux.dev>; Wed,  8 Feb 2023 07:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1480C433EF;
	Wed,  8 Feb 2023 07:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675841584;
	bh=USNCS1tegjEH4VA3lC0DHgJkn0Q3PdFrpSVUUwFkX3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsI0bglPbPEsPBJZYj73ZKIpq2XCC7AYmYRz6oHff/Sj3oiIpudb6eNb089GN7m7F
	 sFUaros6Lx6U9/5L1Jc2TCfnzF4VqNKOwwRsCxg1qAkW71GjoHrM1SaYyxN0wUfG1v
	 3cIhqwfBmYJby0JEC3vLVpx++qVMc2f1a1lggvc6KJvY/aXtLZ5m7JsPoXiOJ0GuHT
	 LcHM36odNzKDjsKENOQCeVQX+mMUKN5w1LR9scgRs+psmCYVEQfA6awdW9AAEWMk+L
	 jNyY1DDSjcpBwrGcYM8z0aI8OINTkWq4lFr9KPy9iMBUz8CFbuOMgtSEipjalmxPcw
	 Vzz/NE4UP5o4g==
Date: Wed, 8 Feb 2023 15:33:00 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] platform/chrome: Fix spelling mistake "Attenetion"
 -> "attention"
Message-ID: <Y+NQLOJ9IlbQJttd@google.com>
References: <20230207091443.143995-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207091443.143995-1-colin.i.king@gmail.com>

Hi Prashant,

On Tue, Feb 07, 2023 at 09:14:43AM +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_warn message, make it lower case
> and fix the spelling.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

It's about time to cut for the coming merge window.  I guess you would
like this simple patch to be included as a fixup for f54c013e7eef
("platform/chrome: cros_typec_vdm: Add Attention support").  Please apply
the patch if it makes sense.

One minor suggestion for the commit title:
"platform/chrome: cros_ec_typec: Fix spelling mistake" looks more clear
to me.

With that:
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
