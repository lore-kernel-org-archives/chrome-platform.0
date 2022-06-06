Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CC91FC8
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 03:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F394DC385A9;
	Mon,  6 Jun 2022 03:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654486726;
	bh=OEdTOdZWGYCQRiRZ5NXyWtz6ywfqiCIXus56RC+98sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CliLscswV1qjgHnxmFI8HlfKiRjTu1I4jtyf3KszfuZdkJMtjhk8YUFITGZ4SGT0m
	 0nE/xwGxExGWyFQY6egpznloG/d8ythVs0btW+yjfOoAvIFNcQlBw6ssQa4RJNt1ea
	 e72tBUJ4kQi40aJiCavTLSTdJBPjmNlHq9h2LBrCe2RBedOgBem5XgOeF/Mkov0/uc
	 izpzHowtPEjiNLCz0TL7GuevKzhbzWqv5MQkZtUIDRydjb7nnl3PKrphPftbsmLXcd
	 c7bnMEDMNk6JFoGslO2fldA6Kck7u1NsxUBCCZ+T5nEU/WZnIje1vwZS6mqB0xsuIM
	 nQHDCpupBzfrA==
Date: Mon, 6 Jun 2022 03:38:42 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Xiang wangx <wangxiang@cdjrlc.com>
Cc: bleung@chromium.org, groeck@chromium.org, gustavoars@kernel.org,
	dustin@howett.net, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cros_ec_commands: Fix syntax errors in comments
Message-ID: <Yp12wuqQx4uHUMAJ@google.com>
References: <20220606022313.22912-1-wangxiang@cdjrlc.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606022313.22912-1-wangxiang@cdjrlc.com>

On Mon, Jun 06, 2022 at 10:23:13AM +0800, Xiang wangx wrote:
> Delete the redundant word 'using'.
> 
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

The corresponding change also applied to EC (https://crrev.com/c/2633984).
