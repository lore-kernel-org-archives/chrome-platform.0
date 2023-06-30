Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6D6185D
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jun 2023 05:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEEBC433C0;
	Fri, 30 Jun 2023 05:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688102030;
	bh=ygsfnNvkDPOnp5olYNMlXhLplV7waio0+Vt0yiqXPz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvGMFTXYOIjE/svvhgW2v0e5qYy7qgpejgYVpiGz/VKT1isnJQfy4de/DQqQGjf1a
	 KBWWQF2+gw/tugTxG2lW9NVQ47V//EDr2Lv988FJJBgIRYytaX+frdJOoAf4rhlduJ
	 eHcja9Pa0y4lSBi7FMtkHe7N3iWInf5BCQpf1aB98fqAhw46eOvSmZ6oSGZNj5SgcT
	 +m1EC2xuUol70ZwEC0q2G2uK/tcMX/xFVpP/G5fmYml2yl+X2/zcqP5a1Otk82jwXt
	 6kHrjo9jjhOzMV65sTVRrdazD+JwJaeOTtDdw57nPHBqJVuJaM53NprHbLm1oUMRtO
	 BoG/jgKcTSvZw==
Date: Fri, 30 Jun 2023 13:13:46 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Yiyuan Guo <yguoaz@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, bleung@chromium.org,
	groeck@chromium.org, dianders@chromium.org,
	mazziesaccount@gmail.com, gwendal@chromium.org,
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] iio: Fix the allocation size for cros_ec_command
Message-ID: <ZJ5kiiuhITCpqwrn@google.com>
References: <20230629132405.1237292-1-yguoaz@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629132405.1237292-1-yguoaz@gmail.com>

On Thu, Jun 29, 2023 at 09:24:05PM +0800, Yiyuan Guo wrote:
> The struct cros_ec_command contains several integer fields and a
> trailing array. An allocation size neglecting the integer fields can
> lead to buffer overrun.
> 
> Signed-off-by: Yiyuan Guo <yguoaz@gmail.com>

Better prefix the commit title with "iio: cros_ec:".

With that:
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
