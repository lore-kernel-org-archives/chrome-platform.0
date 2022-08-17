Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1927B
	for <chrome-platform@lists.linux.dev>; Wed, 17 Aug 2022 01:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37078C433D7;
	Wed, 17 Aug 2022 01:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660700949;
	bh=JH6t49flDz82dY2iQ5L2SrAv6HTwj8E2CK67d8SZze8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thrzMIv4RqUga3k8ipEgOODeyNg+oPto1zN0nCwl57M91KQ67FWP+M2pnHrM4f7RV
	 nyMbihQug18knvAnGzD3sQzfvUkb6xW2Ojzq3WaRx68dVAywibz8XZbAUiMVTp5sKz
	 o/iXY6X0WQ01YfIDJgvtvXPZHY4RwZbYZ+xsfG4EiiT1Xxc36Qx2RmQUwURD7DIQRh
	 6QdZGcL7njVR6KK11xfLpm9jZizc/+f9gszkY5VCWrW5MiPuQLVEvI0U9ieMtNtJfl
	 DIGkpKZ8qc0HVuBWCvJsbxM6P/moBn6wkOoyLNHzJp0ZxPWPigmuMiqbq8s/zOfG3b
	 XVl7Nfz5obRbg==
Date: Wed, 17 Aug 2022 01:49:05 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH v6 5/7] platform/chrome: cros_typec_switch: Register mode
 switches
Message-ID: <YvxJETyDXdABpyXJ@google.com>
References: <20220816214857.2088914-1-pmalani@chromium.org>
 <20220816214857.2088914-6-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816214857.2088914-6-pmalani@chromium.org>

On Tue, Aug 16, 2022 at 09:48:33PM +0000, Prashant Malani wrote:
> Register mode switch devices for Type-C connectors, when they are
> specified by firmware. These control Type-C configuration for any USB
> Type-C mode switches (sometimes known as "muxes") which are controlled
> by the ChromeOS EC.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
