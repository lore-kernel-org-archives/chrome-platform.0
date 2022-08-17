Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FE57B
	for <chrome-platform@lists.linux.dev>; Wed, 17 Aug 2022 01:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C51C433D6;
	Wed, 17 Aug 2022 01:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660700928;
	bh=wWHfPg1K+9e7y2HviJu2z7UZLj7oKPXVzLdLkUJXMR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBwAvtk9/RvJBdFAoATF8thq+U0ZE+BNtmQ9Pf6AE5K8NKRRS8OnagOULObfLPGRF
	 ieejljXmmzWVGvfT5HXApvo7uBaa9MT14SofaNJewDL4jOtbePPjMmkuYhTsEe5wxN
	 XE2MlzW7biBC+fzR/gZ05C5nwMK94eqPWftOljBTRJT8T2OmNlW/eB5cuojUN7fyKz
	 VSDJu3PBDPWrWN4Sg9i0Mjy6iO52t7xbLLMDFypvAshLEMjYMbGZRdmLkOWvitL5Js
	 JrWZ4XYUMZiaWZMOsbQtCGmG00099OAYD+NFENB+FKYQbp9nXhsV76fdR2Gj1xW4T2
	 bWp9vt4DEf+NA==
Date: Wed, 17 Aug 2022 01:48:44 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH v6 3/7] platform/chrome: cros_typec_switch: Set EC retimer
Message-ID: <YvxI/FYiGCMYCo/m@google.com>
References: <20220816214857.2088914-1-pmalani@chromium.org>
 <20220816214857.2088914-4-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816214857.2088914-4-pmalani@chromium.org>

On Tue, Aug 16, 2022 at 09:48:31PM +0000, Prashant Malani wrote:
> Invoke ChromeOS EC host commands to set EC-controlled retimer switches
> to the state the Type-C framework instructs.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
